import 'package:flutter/material.dart';
import 'package:web_susch/constants.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';

class FilterSearch extends StatelessWidget {
  const FilterSearch({super.key, required this.formFieldWidth});

  final double formFieldWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: t.searchpanel.searchParametrs,
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
                FilterItem(
                    width: formFieldWidth,
                    label: t.searchpanel.from,
                    items: ["A", "B", "C"]),
                FilterItem(
                  width: formFieldWidth,
                  label: t.searchpanel.to,
                  items: ["A", "B", "C"],
                ),
                FilterItem(
                    width: formFieldWidth,
                    label: t.searchpanel.cabinType,
                    items: ["A", "B", "C"]),
              ],
            ),
            const SizedBox(height: appPaddingSmall),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilterItem(
                    width: formFieldWidth,
                    label: t.searchpanel.routeType,
                    items: [t.searchpanel.oneWay, t.searchpanel.returnRoute]),
                FilterItem(
                    width: formFieldWidth,
                    label: t.searchpanel.outbound,
                    items: ["A", "B", "C"]),
                FilterItem(
                  width: formFieldWidth,
                  label: t.searchpanel.returnRoute,
                  items: ["A", "B", "C"],
                ),
              ],
            ),
            const SizedBox(height: appPaddingSmall),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
