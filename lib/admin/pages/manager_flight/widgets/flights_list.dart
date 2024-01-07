import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';
import 'package:web_susch/logger.dart';
import 'package:web_susch/shared/models/flight.dart';
import 'package:web_susch/utils.dart';

class FlightsList extends StatelessWidget {
  const FlightsList({super.key, required this.flights});

  final ObservableList<Flight> flights;

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => ScrollableTableView(
          headers: _headers(context),
          rows: flights.map((f) => _row(context, f)).toList(),
        ),
      );

  List<TableViewHeader> _headers(BuildContext context) => [
        TableViewHeader(
          label: t.managepanel.date,
          textStyle: Theme.of(context).textTheme.headlineSmall,
          alignment: Alignment.centerLeft,

          // width: max(400, (400 / 1920) * constrain.minWidth),
          minWidth: 150,
        ),
        TableViewHeader(
          label: t.managepanel.time,
          textStyle: Theme.of(context).textTheme.headlineSmall,
          alignment: Alignment.centerLeft,
          // width: max(150, (150 / 1920) * constrain.minWidth),
          minWidth: 100,
        ),
        TableViewHeader(
          label: t.managepanel.from,
          textStyle: Theme.of(context).textTheme.headlineSmall,
          alignment: Alignment.centerLeft,
          // width: max(200, (200 / 1920) * constrain.minWidth),
          minWidth: 100,
        ),
        TableViewHeader(
          label: t.managepanel.to,
          textStyle: Theme.of(context).textTheme.headlineSmall,
          alignment: Alignment.centerLeft,
          // width: max(200, (200 / 1920) * constrain.minWidth),
          minWidth: 100,
        ),
        TableViewHeader(
          label: t.managepanel.flightNumber,
          textStyle: Theme.of(context).textTheme.headlineSmall,
          alignment: Alignment.centerLeft,
          // width: max(220, (220 / 1920) * constrain.minWidth),
          minWidth: 200,
        ),
        TableViewHeader(
          label: t.managepanel.aircraft,
          textStyle: Theme.of(context).textTheme.headlineSmall,
          alignment: Alignment.centerLeft,
          // width: max(220, (220 / 1920) * constrain.minWidth),
          minWidth: 200,
        ),
        TableViewHeader(
          label: t.managepanel.economyPrice,
          textStyle: Theme.of(context).textTheme.headlineSmall,
          alignment: Alignment.centerLeft,
          // width: max(220, (220 / 1920) * constrain.minWidth),
          minWidth: 250,
        ),
        TableViewHeader(
          label: t.managepanel.buisnessPrice,
          textStyle: Theme.of(context).textTheme.headlineSmall,
          alignment: Alignment.centerLeft,
          // width: max(220, (220 / 1920) * constrain.minWidth),
          minWidth: 250,
        ),
        TableViewHeader(
          label: t.managepanel.firstClassPrice,
          textStyle: Theme.of(context).textTheme.headlineSmall,
          alignment: Alignment.centerLeft,
          // width: max(220, (220 / 1920) * constrain.minWidth),
          minWidth: 250,
        ),
      ];

  TableViewRow _row(BuildContext context, Flight flight) {
    Color backgroundColor = flight.status == FlightStatus.canceled
        ? Theme.of(context).colorScheme.primary
        : Colors.transparent;

    TextStyle textStyle = Theme.of(context).textTheme.titleMedium!;

    if (flight.status == FlightStatus.canceled) {
      textStyle =
          textStyle.copyWith(color: Theme.of(context).colorScheme.onPrimary);
    }

    return TableViewRow(
      height: 60,
      backgroundColor: backgroundColor,
      onTap: () => logger.i("Tap on flight ${flight.flightNumber}"),
      cells: [
        TableViewCell(
          alignment: Alignment.centerLeft,
          child: Text(
            formatDateShort(context, flight.date),
            style: textStyle,
          ),
        ),
        TableViewCell(
          alignment: Alignment.centerLeft,
          child: Text(
            formatTime(context, flight.date),
            style: textStyle,
          ),
        ),
        TableViewCell(
          alignment: Alignment.centerLeft,
          child: Text(
            flight.from,
            style: textStyle,
          ),
        ),
        TableViewCell(
          alignment: Alignment.centerLeft,
          child: Text(
            flight.to,
            style: textStyle,
          ),
        ),
        TableViewCell(
          alignment: Alignment.centerLeft,
          child: Text(
            flight.flightNumber.toString(),
            style: textStyle,
          ),
        ),
        TableViewCell(
          alignment: Alignment.centerLeft,
          child: Text(
            flight.aircraft.toString(),
            style: textStyle,
          ),
        ),
        TableViewCell(
          alignment: Alignment.centerLeft,
          child: Text(
            flight.economyPrice.toString(),
            style: textStyle,
          ),
        ),
        TableViewCell(
          alignment: Alignment.centerLeft,
          child: Text(
            flight.buisnessPrice.toString(),
            style: textStyle,
          ),
        ),
        TableViewCell(
          alignment: Alignment.centerLeft,
          child: Text(
            flight.firstClassPrice.toString(),
            style: textStyle,
          ),
        )
      ],
    );
  }
}
