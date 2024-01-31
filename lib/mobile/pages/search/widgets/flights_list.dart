import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';
import 'package:web_susch/shared/controllers/airports/controller.dart';
import 'package:web_susch/shared/controllers/di/manager.dart';
import 'package:web_susch/shared/models/flight.dart';
import 'package:web_susch/constants.dart';
import 'package:web_susch/shared/ui/icon_text_button.dart';
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
  Widget build(BuildContext context) => Card(
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: () => showCardBotomSheet(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: appPaddingSmall, vertical: appPaddingMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicHeight(
                  child: Row(
                    children: [
                      const Icon(Icons.airplanemode_active),
                      const SizedBox(width: appPaddingSmall),
                      Text('${t.search.fightNumber}: ${flight.flightNumber}'),
                      const VerticalDivider(thickness: 1),
                      Text('${t.search.aircracft}: ${flight.aircraft}'),
                    ],
                  ),
                ),
                const Divider(),
                Row(
                  children: [
                    const Icon(Icons.attach_money),
                    const SizedBox(width: appPaddingSmall),
                    Text('${t.search.price}: ${flight.economyPrice}'),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    const Icon(Icons.calendar_month),
                    const SizedBox(width: appPaddingSmall),
                    Text(
                        '${t.search.time}: ${formatTime(context, flight.date)}  ${t.search.date}: ${formatDateShort(context, flight.date)}'),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  String getAirportNameFromCode(String airportCode) =>
      DIManager.get<AirportController>()
          .airports
          .firstWhere((airport) => airport.code == airportCode)
          .name;

  void showCardBotomSheet(BuildContext context) => showModalBottomSheet(
        useSafeArea: true,
        showDragHandle: true,
        context: context,
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: appPaddingMedium,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.airplanemode_active),
                    const SizedBox(width: appPaddingSmall),
                    Text(
                      '${t.search.fightNumber}: ${flight.flightNumber}',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
                const Divider(),
                Text(
                  '${t.search.from}: ${getAirportNameFromCode(flight.from)}',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  '${t.search.to}: ${getAirportNameFromCode(flight.to)}',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                // Text(
                //   '${t.search.to}: ${getAirportNameFromCode()}',
                //   style: Theme.of(context).textTheme.headlineSmall,
                // ),
                Row(
                  children: [
                    const Icon(Icons.calendar_month),
                    const SizedBox(width: appPaddingSmall),
                    Text(
                      '${t.search.date}: ${formatDateShort(context, flight.date)}',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.timelapse),
                    const SizedBox(width: appPaddingSmall),
                    Text(
                      '${t.search.time}: ${formatTime(context, flight.date)}',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
                const Divider(),
                const SizedBox(height: appPaddingMedium),
                IconTextButton(
                  buttonWidth: double.infinity,
                  onTap: () {},
                  icon: const Icon(Icons.book),
                  label: t.search.book,
                ),
                const SizedBox(height: appPaddingMedium)
              ],
            ),
          );
        },
      );
}
