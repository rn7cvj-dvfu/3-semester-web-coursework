import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:web_susch/shared/controllers/airports/controller.dart';
import 'package:web_susch/shared/controllers/di/manager.dart';
import 'package:web_susch/shared/controllers/flights/controller.dart';
import 'package:web_susch/shared/ui/icon_text_button.dart';
import 'package:web_susch/utils.dart';
import 'package:web_susch/constants.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';

class Filters extends StatelessWidget {
  Filters({super.key});

  final Observable<bool> isSeachShow = Observable(true);

  final FlightsController _flightsController =
      DIManager.get<FlightsController>();

  final List<DropdownMenuEntry> airposrtEntries =
      DIManager.get<AirportController>()
          .airports
          .map((a) => DropdownMenuEntry(value: a.code, label: a.name))
          .toList();

  String? fromAirportCode;
  String? toAirportCode;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(appRoundRadiusMedium),
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
      ),
      padding: const EdgeInsets.all(appPaddingMedium),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 300),
        child: LayoutBuilder(
          builder: (context, constrains) => Observer(
            builder: (context) {
              if (!isSeachShow.value) {
                return IconTextButton(
                  buttonWidth: constrains.maxWidth * 0.9,
                  onTap: () => runInAction(() => isSeachShow.value = true),
                  icon: const Icon(Icons.arrow_downward),
                  label: t.search.showSearch,
                );
              }
              return Column(
                children: [
                  FilterItem(
                    onSelected: (code) {
                      fromAirportCode = code;
                      _flightsController.fromAirportCode = code;
                    },
                    items: airposrtEntries,
                    label: t.search.from,
                    width: constrains.maxWidth * 0.9,
                    initialSelection: fromAirportCode,
                  ),
                  const SizedBox(height: appPaddingMedium),
                  FilterItem(
                    onSelected: (code) {
                      toAirportCode = code;
                      _flightsController.toAirportCode = code;
                    },
                    items: airposrtEntries,
                    label: t.search.to,
                    width: constrains.maxWidth * 0.9,
                    initialSelection: toAirportCode,
                  ),
                  const SizedBox(height: appPaddingMedium),
                  FligthTimePicker(
                    width: constrains.maxWidth * 0.9,
                  ),
                  const SizedBox(height: appPaddingMedium),
                  IconTextButton(
                    buttonWidth: constrains.maxWidth * 0.9,
                    onTap: () => runInAction(() => isSeachShow.value = false),
                    icon: const Icon(Icons.arrow_upward),
                    label: t.search.hideSeacrh,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class FilterItem extends StatelessWidget {
  final List<DropdownMenuEntry> items;
  final Function(dynamic) onSelected;
  final String label;
  final double width;
  final dynamic? initialSelection;

  const FilterItem(
      {super.key,
      required this.items,
      required this.label,
      required this.width,
      required this.onSelected,
      this.initialSelection});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      initialSelection: initialSelection,
      onSelected: onSelected,
      label: Text(label),
      width: width,
      dropdownMenuEntries: items,
    );
  }
}

class FligthTimePicker extends StatelessWidget {
  FligthTimePicker({super.key, required this.width});

  final double width;

  final Observable<DateTime> selectedDate = Observable(
    DIManager.get<FlightsController>().date,
  );

  final FlightsController _flightsController =
      DIManager.get<FlightsController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        DateTime? newSelectedDate = await showDatePicker(
            context: context,
            initialDate: selectedDate.value,
            firstDate: DateTime(2015),
            lastDate: DateTime(2034));

        if (newSelectedDate == null) return;

        _flightsController.date = newSelectedDate;

        runInAction(() => selectedDate.value = newSelectedDate);
      },
      borderRadius: BorderRadius.circular(4),
      child: Container(
        width: width,
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: t.search.date,
            // labelStyle: Theme.of(context).textTheme.displaySmall,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Observer(
            builder: (_) {
              return Text(
                formatDateFull(context, selectedDate.value),
                textAlign: TextAlign.center,
              );
            },
          ),
        ),
      ),
    );
  }
}
