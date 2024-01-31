import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';
import 'package:web_susch/shared/models/flight.dart';
import 'package:web_susch/constants.dart';
import 'package:web_susch/utils.dart';

class FligthList extends StatelessWidget {
  const FligthList({super.key, required this.flights});

  final ObservableList<Flight> flights;

  @override
  Widget build(BuildContext context) {
    if (flights.isEmpty) return Center(child: Text(t.search.noFlightsFound));

    return ListView(
      children: flights.map((f) => FligthCard(flight: f)).toList(),
    );
  }
}

class FligthCard extends StatelessWidget {
  const FligthCard({super.key, required this.flight});

  final Flight flight;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: appPaddingSmall, vertical: appPaddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Icon(Icons.airplanemode_active),
                  SizedBox(width: appPaddingSmall),
                  Text('${t.search.fightNumber}: ${flight.flightNumber}'),
                  VerticalDivider(thickness: 1),
                  Text('${t.search.aircracft}: ${flight.aircraft}'),
                ],
              ),
            ),
            Divider(),
            Row(
              children: [
                Icon(Icons.attach_money),
                SizedBox(width: appPaddingSmall),
                Text('${t.search.price}: ${flight.economyPrice}'),
              ],
            ),
            Divider(),
            Row(
              children: [
                Icon(Icons.calendar_month),
                SizedBox(width: appPaddingSmall),
                Text(
                    '${t.search.time}: ${formatTime(context, flight.date)}  ${t.search.date}: ${formatDateShort(context, flight.date)}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
