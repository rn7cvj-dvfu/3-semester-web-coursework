import 'package:flutter/material.dart';
import 'package:web_susch/admin/pages/admin_panel/widgets/text_input.dart';
import 'package:web_susch/constants.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';

class ReturnFlightDetails extends StatelessWidget {
  const ReturnFlightDetails({super.key, required this.formFieldWidth});

  final double formFieldWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: t.searchpanel.ofd,
          labelStyle: Theme.of(context).textTheme.displaySmall,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(appRoundRadiusMedium),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: appPaddingSmall),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('${t.searchpanel.from}: CAI'),
                Text('${t.searchpanel.to}: AUH'),
                Text('${t.searchpanel.cabinType}: Economy'),
                Text('${t.searchpanel.date}: 2021-10-10'),
                Text('${t.searchpanel.fightNumber}: 1234')
              ],
            ),
            const SizedBox(height: appPaddingSmall),
          ],
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
