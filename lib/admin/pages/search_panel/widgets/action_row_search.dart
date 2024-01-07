import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_susch/admin/pages/manager_flight/widgets/edit_flight_dialog.dart';
import 'package:web_susch/admin/pages/manager_flight/widgets/filters.dart';
import 'package:web_susch/admin/pages/manager_flight/widgets/import_changes_dialog.dart';
import 'package:web_susch/constants.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';

class ActionRowSearch extends StatelessWidget {
  const ActionRowSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: t.searchpanel.cbf,
          labelStyle: Theme.of(context).textTheme.displaySmall,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(appRoundRadiusMedium),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: appPaddingMedium),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilterItem(
                    width: 200,
                    label: t.searchpanel.from,
                    items: ["A", "B", "C"]),
                TextButton.icon(
                  onPressed: () {},
                  label: Text(t.searchpanel.bookFlight),
                  icon: const Icon(Icons.check),
                  style: ButtonStyle(
                    textStyle: MaterialStatePropertyAll(
                        Theme.of(context).textTheme.titleMedium),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  label: Text(t.login.exit),
                  icon: const Icon(Icons.cancel),
                  style: ButtonStyle(
                    textStyle: MaterialStatePropertyAll(
                        Theme.of(context).textTheme.titleMedium),
                  ),
                ),
              ],
            ),
            // const SizedBox(height: appPaddingMedium),
          ],
        ),
      ),
    );
  }

  void openEditFlightDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(t.managepanel.editFlight),
          content: EditFlightDialog(),
          actions: [
            ElevatedButton(
              onPressed: () {},
              child: Text(t.common.save),
            ),
            ElevatedButton(
              onPressed: context.pop,
              child: Text(t.common.cancel),
            ),
          ],
        ),
      );

  void openImportChangesDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(t.managepanel.importChanges),
          content: ImportChangesDialog(),
          actions: [
            ElevatedButton(
              onPressed: () {},
              child: Text(t.managepanel.import),
            ),
          ],
        ),
      );
}
