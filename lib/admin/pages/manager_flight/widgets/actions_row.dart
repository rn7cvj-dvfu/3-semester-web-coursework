import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_susch/admin/pages/admin_panel/widgets/text_input.dart';
import 'package:web_susch/admin/pages/manager_flight/widgets/edit_flight_dialog.dart';
import 'package:web_susch/admin/pages/manager_flight/widgets/import_changes_dialog.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';

class ActionRow extends StatelessWidget {
  const ActionRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton.icon(
          onPressed: () {},
          label: Text(t.managepanel.cancelFlight),
          icon: const Icon(Icons.cancel),
          style: ButtonStyle(
            textStyle: MaterialStatePropertyAll(
                Theme.of(context).textTheme.titleMedium),
          ),
        ),
        TextButton.icon(
          onPressed: () => openEditFlightDialog(context),
          label: Text(t.managepanel.editFlight),
          icon: const Icon(Icons.edit),
          style: ButtonStyle(
            textStyle: MaterialStatePropertyAll(
                Theme.of(context).textTheme.titleMedium),
          ),
        ),
        TextButton.icon(
          onPressed: () => openImportChangesDialog(context),
          label: Text(t.managepanel.importChanges),
          icon: const Icon(Icons.import_export),
          style: ButtonStyle(
            textStyle: MaterialStatePropertyAll(
                Theme.of(context).textTheme.titleMedium),
          ),
        ),
      ],
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
            FilePickerButton(
              onFilePicked: (String path) => context.pop(),
            ),
          ],
        ),
      );
}
