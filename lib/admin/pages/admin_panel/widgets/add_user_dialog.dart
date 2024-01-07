import 'package:flutter/material.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';
import 'package:web_susch/shared/controllers/di/manager.dart';
import 'package:web_susch/shared/controllers/users/controller.dart';
import 'package:web_susch/shared/ui/filter_item.dart';
import 'package:web_susch/shared/ui/text_filed.dart';
import 'package:web_susch/shared/ui/time_picker.dart';

class AddUserDialog extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  DateTime birthday = DateTime.now();
  int officeId = 1;

  final UsersController usersController = DIManager.get<UsersController>();

  @override
  Widget build(BuildContext context) {
    emailController.addListener(() {
      usersController.newUserEmail = emailController.text;
    });
    nameController.addListener(() {
      usersController.newUserFirstName = nameController.text;
    });
    lastNameController.addListener(() {
      usersController.newUserLastName = lastNameController.text;
    });
    passwordController.addListener(() {
      usersController.newUserPassword = passwordController.text;
    });

    const double formFieldWidth = 300;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomTextField(
          width: formFieldWidth,
          label: t.adminpanel.email,
          controller: emailController,
        ),
        CustomTextField(
          width: formFieldWidth,
          label: t.adminpanel.name,
          controller: nameController,
        ),
        CustomTextField(
          width: formFieldWidth,
          label: t.adminpanel.lastName,
          controller: lastNameController,
        ),
        const SizedBox(height: 18),
        FilterItem.Office(
          formFieldWidth,
          (newOfficeId) => usersController.newUserOfficeId = newOfficeId,
        ),
        const SizedBox(height: 18),
        CustomTimePicker(
          label: t.adminpanel.birthday,
          width: formFieldWidth,
          onSelect: (newDate) => usersController.newUserBirthday = newDate,
        ),
        CustomTextField(
          width: formFieldWidth,
          label: t.login.password,
          canObscure: true,
          controller: passwordController,
        ),
      ],
    );
  }
}
