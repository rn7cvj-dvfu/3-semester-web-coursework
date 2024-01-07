import 'package:flutter/material.dart';
import 'package:web_susch/admin/pages/admin_panel/widgets/text_input.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';

class EditRoleDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const double formFieldWidth = 300;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AddTextField(width: formFieldWidth, labelText: t.adminpanel.email),
        AddTextField(width: formFieldWidth, labelText: t.adminpanel.name),
        AddTextField(width: formFieldWidth, labelText: t.adminpanel.lastName),
        AddSelectField(
            width: formFieldWidth,
            labelText: t.adminpanel.office,
            options: ["A", "B", "C"]),
        AddSelectField(
            width: formFieldWidth,
            labelText: t.adminpanel.changeRole,
            options: ["Admin", "User"]),
      ],
    );
  }
}
