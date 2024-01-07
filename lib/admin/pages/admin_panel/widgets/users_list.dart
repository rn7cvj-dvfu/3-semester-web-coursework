import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';
import 'package:web_susch/logger.dart';
import 'package:web_susch/shared/models/user.dart';

class UsersList extends StatelessWidget {
  const UsersList({super.key, required this.users});

  final ObservableList<User> users;

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) {
          if (users.isEmpty) {
            return Center(
              child: Text(
                t.adminpanel.noUsersFound,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            );
          }

          return ScrollableTableView(
            headers: _headers(context),
            rows: users.map((u) => _row(context, u)).toList(),
          );
        },
      );

  List<TableViewHeader> _headers(BuildContext context) => [
        TableViewHeader(
          label: t.adminpanel.name,
          textStyle: Theme.of(context).textTheme.headlineSmall,
          alignment: Alignment.centerLeft,
          // width: max(400, (400 / 1920) * constrain.minWidth),
          minWidth: 200,
        ),
        TableViewHeader(
          label: t.adminpanel.lastName,
          textStyle: Theme.of(context).textTheme.headlineSmall,
          alignment: Alignment.centerLeft,
          // width: max(150, (150 / 1920) * constrain.minWidth),
          minWidth: 200,
        ),
        TableViewHeader(
          label: t.adminpanel.age,
          textStyle: Theme.of(context).textTheme.headlineSmall,
          alignment: Alignment.centerLeft,
          // width: max(200, (200 / 1920) * constrain.minWidth),
          minWidth: 150,
        ),
        TableViewHeader(
          label: t.adminpanel.email,
          textStyle: Theme.of(context).textTheme.headlineSmall,
          alignment: Alignment.centerLeft,
          // width: max(200, (200 / 1920) * constrain.minWidth),
          minWidth: 400,
        ),
        TableViewHeader(
          label: t.adminpanel.office,
          textStyle: Theme.of(context).textTheme.headlineSmall,
          alignment: Alignment.centerLeft,
          // width: max(220, (220 / 1920) * constrain.minWidth),
          minWidth: 400,
        ),
      ];

  TableViewRow _row(BuildContext context, User user) {
    Color backgroundColor = user.status == UserStatus.admin
        ? Theme.of(context).colorScheme.secondary
        : Colors.transparent;

    TextStyle textStyle = Theme.of(context).textTheme.titleMedium!;

    if (user.status == UserStatus.admin) {
      textStyle =
          textStyle.copyWith(color: Theme.of(context).colorScheme.onSecondary);
    }

    return TableViewRow(
      height: 60,
      backgroundColor: backgroundColor,
      onTap: () => logger.i("Tap on user ${user.firstName}"),
      cells: [
        TableViewCell(
          alignment: Alignment.centerLeft,
          child: Text(
            user.firstName,
            style: textStyle,
          ),
        ),
        TableViewCell(
          alignment: Alignment.centerLeft,
          child: Text(
            user.lastName,
            style: textStyle,
          ),
        ),
        TableViewCell(
          alignment: Alignment.centerLeft,
          child: Text(
            user.age.toString(),
            style: textStyle,
          ),
        ),
        TableViewCell(
          alignment: Alignment.centerLeft,
          child: Text(
            user.email,
            style: textStyle,
          ),
        ),
        TableViewCell(
          alignment: Alignment.centerLeft,
          child: Text(
            user.office,
            style: textStyle,
          ),
        ),
      ],
    );
  }
}
