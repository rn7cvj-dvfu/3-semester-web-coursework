import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:web_susch/admin/navigation/navigator.dart';
import 'package:web_susch/admin/pages/admin_panel/widgets/edit_role_dialog.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';
import 'package:web_susch/admin/pages/admin_panel/widgets/add_user_dialog.dart';
import 'package:web_susch/admin/pages/admin_panel/widgets/office_filter.dart';
import 'package:web_susch/shared/controllers/di/manager.dart';
import 'package:web_susch/shared/controllers/token/controller.dart';
import 'package:web_susch/shared/controllers/users/controller.dart';

class ActionsRow extends StatelessWidget {
  ActionsRow({super.key});

  final UsersController usersController = DIManager.get<UsersController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OfficeFilter(),
        Expanded(child: Container()),
        TextButton.icon(
          onPressed: () => openAddUserDialog(context),
          label: Text(t.adminpanel.addUser),
          icon: const Icon(Icons.add),
          style: ButtonStyle(
            textStyle: MaterialStatePropertyAll(
                Theme.of(context).textTheme.titleMedium),
          ),
        ),
        TextButton.icon(
          onPressed: () {
            DIManager.get<TokenContoller>().writeNewToken(null);
            AppNavigator.openLoginPage();
          },
          label: Text(t.adminpanel.exit),
          icon: const Icon(Icons.exit_to_app),
          style: ButtonStyle(
            textStyle: MaterialStatePropertyAll(
                Theme.of(context).textTheme.titleMedium),
          ),
        )
      ],
    );
  }

  void openAddUserDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(t.adminpanel.addUser),
          content: Observer(builder: (_) {
            if (usersController.isUserAdding) {
              return LoadingAnimationWidget.prograssiveDots(
                  color: Theme.of(context).colorScheme.primary, size: 80);
            }

            return AddUserDialog();
          }),
          actions: [
            ElevatedButton(
              onPressed: () async {
                await usersController.craeteUser();
                await usersController.getUsers();
                context.pop();
              },
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
