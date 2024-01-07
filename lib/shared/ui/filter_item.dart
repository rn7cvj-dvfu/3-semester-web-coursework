import 'package:flutter/material.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';
import 'package:web_susch/shared/controllers/di/manager.dart';
import 'package:web_susch/shared/controllers/office/controller.dart';

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

  factory FilterItem.Office(double width, Function(dynamic) onSelected) {
    final List<DropdownMenuEntry> officeEntries =
        DIManager.get<OfficeController>()
            .offices
            .map((office) =>
                DropdownMenuEntry(value: office.id, label: office.title))
            .toList();

    return FilterItem(
      initialSelection: 1,
      onSelected: onSelected,
      items: officeEntries,
      label: t.adminpanel.selectOffice,
      width: width,
    );
  }

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
