import 'package:flutter/material.dart';
import 'package:web_susch/shared/controllers/airports/controller.dart';
import 'package:web_susch/shared/controllers/di/manager.dart';
import 'package:web_susch/admin/pages/admin_panel/widgets/text_input.dart';
import 'package:web_susch/constants.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';

class Filter extends StatelessWidget {
  Filter({super.key, required this.formFieldWidth});

  final double formFieldWidth;

  final AirportController airportsController =
      DIManager.get<AirportController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: t.managepanel.fliterBy,
          labelStyle: Theme.of(context).textTheme.displaySmall,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(appRoundRadiusMedium),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: appPaddingMedium),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilterItem(
                    width: formFieldWidth,
                    label: t.managepanel.from,
                    items:
                        airportsController.airports.map((a) => a.code).toList(),
                  ),
                  FilterItem(
                    width: formFieldWidth,
                    label: t.managepanel.to,
                    items:
                        airportsController.airports.map((a) => a.code).toList(),
                  ),
                  FilterItem(
                      width: formFieldWidth,
                      label: t.managepanel.sortBy,
                      items: ["A", "B", "C"]),
                ],
              ),
              const SizedBox(height: appPaddingMedium),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilterItem(
                      width: formFieldWidth,
                      label: t.managepanel.outbound,
                      items: ["A", "B", "C"]),
                  FilterItem(
                    width: formFieldWidth,
                    label: t.managepanel.flightNumber,
                    items: ["A", "B", "C"],
                  ),
                  SizedBox(
                    width: formFieldWidth,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(t.common.apply,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary),
                          textAlign: TextAlign.center),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FilterItem extends StatelessWidget {
  final List<String> items;
  final String label;
  final double width;

  const FilterItem(
      {super.key,
      required this.items,
      required this.label,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      label: Text(label),
      width: width,
      dropdownMenuEntries:
          items.map((i) => DropdownMenuEntry(value: i, label: i)).toList(),
    );
  }
}
