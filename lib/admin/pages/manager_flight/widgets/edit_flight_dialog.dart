import 'package:flutter/material.dart';
import 'package:web_susch/admin/pages/admin_panel/widgets/text_input.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';

class EditFlightDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const double formFieldWidth = 600;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AddTextField(width: formFieldWidth, labelText: t.managepanel.from),
        AddTextField(width: formFieldWidth, labelText: t.managepanel.to),
        AddTextField(
            width: formFieldWidth, labelText: t.managepanel.flightNumber),
        AddTextField(width: formFieldWidth, labelText: t.managepanel.date),
        AddTextField(width: formFieldWidth, labelText: t.managepanel.time),
        AddTextField(
            width: formFieldWidth, labelText: t.managepanel.economyPrice),
      ],
    );
  }
}
