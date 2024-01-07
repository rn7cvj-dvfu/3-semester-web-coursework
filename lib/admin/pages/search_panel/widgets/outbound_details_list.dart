import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:web_susch/shared/models/outbound.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';
import 'package:web_susch/logger.dart';

class OutboundDetailsList extends StatelessWidget {
  const OutboundDetailsList({super.key, required this.outbounds});

  final ObservableList<Outbound> outbounds;

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => ScrollableTableView(
          headers: _headers(context),
          rows: outbounds.map((o) => _row(context, o)).toList(),
        ),
      );

  List<TableViewHeader> _headers(BuildContext context) => [
        TableViewHeader(
          label: t.searchpanel.from,
          textStyle: Theme.of(context).textTheme.headlineSmall,
          alignment: Alignment.centerLeft,
          // width: max(400, (400 / 1920) * constrain.minWidth),
          minWidth: 150,
        ),
        TableViewHeader(
          label: t.searchpanel.to,
          textStyle: Theme.of(context).textTheme.headlineSmall,
          alignment: Alignment.centerLeft,
          // width: max(150, (150 / 1920) * constrain.minWidth),
          minWidth: 150,
        ),
        TableViewHeader(
          label: t.searchpanel.date,
          textStyle: Theme.of(context).textTheme.headlineSmall,
          alignment: Alignment.centerLeft,
          // width: max(200, (200 / 1920) * constrain.minWidth),
          minWidth: 100,
        ),
        TableViewHeader(
          label: t.searchpanel.fightNumber,
          textStyle: Theme.of(context).textTheme.headlineSmall,
          alignment: Alignment.centerLeft,
          // width: max(200, (200 / 1920) * constrain.minWidth),
          minWidth: 300,
        ),
        TableViewHeader(
          label: t.searchpanel.cabinPrice,
          textStyle: Theme.of(context).textTheme.headlineSmall,
          alignment: Alignment.centerLeft,
          // width: max(220, (220 / 1920) * constrain.minWidth),
          minWidth: 300,
        ),
        TableViewHeader(
          label: t.searchpanel.numberOfStops,
          textStyle: Theme.of(context).textTheme.headlineSmall,
          alignment: Alignment.centerLeft,
          // width: max(220, (220 / 1920) * constrain.minWidth),
          minWidth: 300,
        ),
      ];

  TableViewRow _row(BuildContext context, Outbound outbound) {
    return TableViewRow(
      height: 60,
      onTap: () => logger.i("Tap on user ${outbound.flightNumber}"),
      cells: [
        TableViewCell(
          alignment: Alignment.centerLeft,
          child: Text(
            outbound.from,
          ),
        ),
        TableViewCell(
          alignment: Alignment.centerLeft,
          child: Text(
            outbound.to,
          ),
        ),
        TableViewCell(
          alignment: Alignment.centerLeft,
          child: Text(
            outbound.date.toString(),
          ),
        ),
        TableViewCell(
          alignment: Alignment.centerLeft,
          child: Text(
            outbound.flightNumber.toString(),
          ),
        ),
        TableViewCell(
          alignment: Alignment.centerLeft,
          child: Text(
            outbound.cabinPrice.toString(),
          ),
        ),
        TableViewCell(
          alignment: Alignment.centerLeft,
          child: Text(
            outbound.numberOfStops.toString(),
          ),
        ),
      ],
    );
  }
}
