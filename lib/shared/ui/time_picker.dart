import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';
import 'package:web_susch/logger.dart';
import 'package:web_susch/utils.dart';

class CustomTimePicker extends StatelessWidget {
  CustomTimePicker({
    super.key,
    required this.label,
    required this.width,
    required this.onSelect,
  });

  final double width;
  final String label;
  final Observable<DateTime> selectedDate = Observable(DateTime.now());
  final Observable<bool> _isHovered = Observable(false);

  final Function(DateTime newDate) onSelect;

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

        onSelect(newSelectedDate);

        runInAction(() => selectedDate.value = newSelectedDate);
      },
      onHover: (bool isHovered) => runInAction(
        () => _isHovered.value = isHovered,
      ),
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        width: width,
        child: Observer(builder: (_) {
          return InputDecorator(
            decoration: InputDecoration(
              labelText: label,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Text(
              formatDateFull(context, selectedDate.value),
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          );
        }),
      ),
    );
  }
}
