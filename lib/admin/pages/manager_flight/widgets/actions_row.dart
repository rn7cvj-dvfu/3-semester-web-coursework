import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_susch/admin/pages/admin_panel/widgets/text_input.dart';
import 'package:web_susch/admin/pages/manager_flight/widgets/edit_flight_dialog.dart';
import 'package:web_susch/admin/pages/manager_flight/widgets/import_changes_dialog.dart';
import 'package:web_susch/shared/controllers/flights/controller.dart';
import 'package:web_susch/shared/controllers/flights/converter.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';
import 'package:web_susch/shared/ui/time_picker.dart';

class ActionRow extends StatelessWidget {
  const ActionRow({super.key});

  @override
  Widget build(BuildContext context) {
    const double formFieldWidth = 300;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // TextButton.icon(
        //   onPressed: () {},
        //   label: Text(t.managepanel.cancelFlight),
        //   icon: const Icon(Icons.cancel),
        //   style: ButtonStyle(
        //     textStyle: MaterialStatePropertyAll(
        //         Theme.of(context).textTheme.titleMedium),
        //   ),
        // ),
        // TextButton.icon(
        //   onPressed: () => openEditFlightDialog(context),
        //   label: Text(t.managepanel.editFlight),
        //   icon: const Icon(Icons.edit),
        //   style: ButtonStyle(
        //     textStyle: MaterialStatePropertyAll(
        //         Theme.of(context).textTheme.titleMedium),
        //   ),
        // ),
        // CustomTimePicker(
        //   label: t.adminpanel.birthday,
        //   width: formFieldWidth,
        //   onSelect: (newDate) => flightConverter.dateTo = newDate,
        // ),
        // CustomTimePicker(
        //   label: t.adminpanel.birthday,
        //   width: formFieldWidth,
        //   onSelect: (newDate) => usersController.newUserBirthday = newDate,
        // ),
        const FileDownloadButton(),
        FilePickerButton(
          onFilePicked: (String path) => context.pop(),
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
}
