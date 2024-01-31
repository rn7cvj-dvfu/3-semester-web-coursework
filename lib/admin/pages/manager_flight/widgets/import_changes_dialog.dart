import 'package:flutter/material.dart';
import 'package:web_susch/admin/pages/admin_panel/widgets/text_input.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';

class ImportChangesDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const double formFieldWidth = 600;
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AddTextField(
            width: formFieldWidth,
            labelText: 'Please select the text file with the changes'),
        AddTextField(
            width: formFieldWidth, labelText: 'Successful Changes Applied'),
        AddTextField(
            width: formFieldWidth, labelText: 'Duplicate Records Discarded'),
        AddTextField(
            width: formFieldWidth,
            labelText: 'Records with missing fields discarded'),
      ],
    );
  }
}
