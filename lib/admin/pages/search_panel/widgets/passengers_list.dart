import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:web_susch/shared/models/outbound.dart';
import 'package:web_susch/shared/models/passenger.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';
import 'package:web_susch/logger.dart';

class PassengersList extends StatelessWidget {
  const PassengersList({super.key, required this.passengers});

  final ObservableList<Passenger> passengers;

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => ScrollableTableView(
          headers: _headers(context),
          rows: passengers.map((p) => _row(context, p)).toList(),
        ),
      );

  List<TableViewHeader> _headers(BuildContext context) => [
        TableViewHeader(
          label: t.passengerpanel.firstname,
          textStyle: Theme.of(context).textTheme.headlineSmall,
          alignment: Alignment.centerLeft,
          // width: max(400, (400 / 1920) * constrain.minWidth),
          minWidth: 150,
        ),
        TableViewHeader(
          label: t.passengerpanel.lastname,
          textStyle: Theme.of(context).textTheme.headlineSmall,
          alignment: Alignment.centerLeft,
          // width: max(150, (150 / 1920) * constrain.minWidth),
          minWidth: 150,
        ),
        TableViewHeader(
          label: t.passengerpanel.birthdate,
          textStyle: Theme.of(context).textTheme.headlineSmall,
          alignment: Alignment.centerLeft,
          // width: max(200, (200 / 1920) * constrain.minWidth),
          minWidth: 100,
        ),
        TableViewHeader(
          label: t.passengerpanel.passportNumber,
          textStyle: Theme.of(context).textTheme.headlineSmall,
          alignment: Alignment.centerLeft,
          // width: max(200, (200 / 1920) * constrain.minWidth),
          minWidth: 300,
        ),
        TableViewHeader(
          label: t.passengerpanel.passportCountry,
          textStyle: Theme.of(context).textTheme.headlineSmall,
          alignment: Alignment.centerLeft,
          // width: max(220, (220 / 1920) * constrain.minWidth),
          minWidth: 300,
        ),
        TableViewHeader(
          label: t.passengerpanel.phone,
          textStyle: Theme.of(context).textTheme.headlineSmall,
          alignment: Alignment.centerLeft,
          // width: max(220, (220 / 1920) * constrain.minWidth),
          minWidth: 300,
        ),
      ];

  TableViewRow _row(BuildContext context, Passenger passenger) {
    return TableViewRow(
      height: 60,
      onTap: () =>
          logger.i("Tap on user ${passenger.firstName} ${passenger.lastName}"),
      cells: [
        TableViewCell(
          alignment: Alignment.centerLeft,
          child: Text(
            passenger.firstName,
          ),
        ),
        TableViewCell(
          alignment: Alignment.centerLeft,
          child: Text(
            passenger.lastName,
          ),
        ),
        TableViewCell(
          alignment: Alignment.centerLeft,
          child: Text(
            passenger.birthdate,
          ),
        ),
        TableViewCell(
          alignment: Alignment.centerLeft,
          child: Text(
            passenger.passportNumber.toString(),
          ),
        ),
        TableViewCell(
          alignment: Alignment.centerLeft,
          child: Text(
            passenger.passportCountry,
          ),
        ),
        TableViewCell(
          alignment: Alignment.centerLeft,
          child: Text(
            passenger.phone.toString(),
          ),
        ),
      ],
    );
  }
}
