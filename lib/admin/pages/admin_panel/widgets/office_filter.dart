import 'package:flutter/material.dart';
import 'package:web_susch/shared/controllers/di/manager.dart';
import 'package:web_susch/shared/controllers/office/controller.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';
import 'package:web_susch/shared/controllers/users/controller.dart';

class OfficeFilter extends StatelessWidget {
  OfficeFilter({super.key});

  final OfficeController controller = DIManager.get<OfficeController>();

  final UsersController usersController = DIManager.get<UsersController>();

  final List<DropdownMenuEntry> officeEntries = DIManager.get<
          OfficeController>()
      .offices
      .map((office) => DropdownMenuEntry(value: office.id, label: office.title))
      .toList();

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      label: Text(t.adminpanel.selectOffice),
      width: 200,
      initialSelection: 1,
      onSelected: (newOfficeId) {
        usersController.selectedOfficeId = newOfficeId;
        usersController.getUsers();
      },
      dropdownMenuEntries: officeEntries,
    );
  }
}
