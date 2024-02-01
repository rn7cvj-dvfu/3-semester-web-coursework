import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mobx/mobx.dart';
import 'package:web_susch/constants.dart';
import 'package:web_susch/shared/controllers/di/manager.dart';
import 'package:web_susch/shared/controllers/users/controller.dart';
import 'package:web_susch/shared/models/user.dart';
import 'package:web_susch/admin/navigation/navigator.dart';
import 'package:web_susch/admin/pages/admin_panel/widgets/actions_row.dart';
import 'package:web_susch/admin/pages/admin_panel/widgets/edit_role_dialog.dart';
import 'package:web_susch/admin/pages/admin_panel/widgets/office_filter.dart';
import 'package:web_susch/admin/pages/admin_panel/widgets/user_action_row.dart';
import 'package:web_susch/admin/pages/admin_panel/widgets/users_list.dart';
import 'widgets/add_user_dialog.dart';

class AdminPanelLandscape extends StatelessWidget {
  AdminPanelLandscape({super.key});

  final UsersController usersController = DIManager.get<UsersController>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: appPaddingLarge, vertical: appPaddingMedium),
              child: ActionsRow(),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(appPaddingLarge),
                child: Observer(builder: (_) {
                  if (usersController.isLoading) {
                    return Center(
                      child: LoadingAnimationWidget.prograssiveDots(
                        color: Theme.of(context).colorScheme.primary,
                        size: 80,
                      ),
                    );
                  }

                  return UsersList(
                    users: usersController.users.asObservable(),
                  );
                }),
              ),
            ),
            // const Padding(
            //   padding: EdgeInsets.all(appPaddingLarge),
            //   child: UserActionRow(),
            // ),
          ],
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Column(
  //       children: [
  //         Row(
  //           children: [
  //             TextButton(
  //               // onPressed: AppNavigator.openAddUserDialog,
  //               onPressed: () {
  //                 showDialog(
  //                   context: context,
  //                   builder: (context) => AlertDialog(
  //                     title: Text('Add User'),
  //                     content: AddUserPage(),
  //                     actions: [
  //                       ElevatedButton(
  //                         onPressed: () {},
  //                         child: Text('Save'),
  //                       ),
  //                       SizedBox(width: 16),
  //                       ElevatedButton(
  //                         onPressed: () {},
  //                         child: Text('Cancel'),
  //                       ),
  //                     ],
  //                   ),
  //                 );
  //               },
  //               child: Text(
  //                 'Add user',
  //                 style: TextStyle(),
  //               ),
  //             ),
  //             TextButton(
  //               onPressed: () {
  //                 // TODO
  //               },
  //               child: const Text(
  //                 'Exit',
  //                 style: TextStyle(),
  //               ),
  //             ),
  //           ],
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.all(16),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //             children: [
  //               ElevatedButton(
  //                 onPressed: () {
  //                   Navigator.push(
  //                     context,
  //                     MaterialPageRoute(builder: (context) => EditRolePage()),
  //                   );
  //                 },
  //                 child: const Text('Change Role'),
  //               ),
  //               ElevatedButton(
  //                 onPressed: () {
  //                   // TODO
  //                 },
  //                 child: const Text('Disable/Enable Login'),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
