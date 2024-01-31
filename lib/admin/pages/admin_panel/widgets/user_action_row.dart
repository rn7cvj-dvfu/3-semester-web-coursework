import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_susch/admin/pages/admin_panel/widgets/edit_role_dialog.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';

class UserActionRow extends StatelessWidget {
  const UserActionRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton.icon(
          onPressed: () => openEditRoleDialog(context),
          label: Text(t.adminpanel.changeRole),
          icon: const Icon(Icons.change_circle_outlined),
          style: ButtonStyle(
            textStyle: MaterialStatePropertyAll(
                Theme.of(context).textTheme.titleMedium),
          ),
        ),
      ],
    );
  }

  void openEditRoleDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(t.adminpanel.changeRole),
          content: EditRoleDialog(),
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
