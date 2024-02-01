import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:web_susch/admin/pages/manager_flight/widgets/actions_row.dart';
import 'package:web_susch/admin/pages/manager_flight/widgets/filters.dart';
import 'package:web_susch/constants.dart';
import 'package:web_susch/shared/models/flight.dart';
import 'package:web_susch/admin/pages/admin_panel/widgets/actions_row.dart';
import 'package:web_susch/admin/pages/admin_panel/widgets/text_input.dart';
import 'package:web_susch/admin/pages/admin_panel/widgets/user_action_row.dart';
import 'package:web_susch/admin/pages/manager_flight/widgets/flights_list.dart';

class ManageFlightPanel extends StatelessWidget {
  ManageFlightPanel({super.key});

  final List<Flight> mockFlights = [
    Flight(
      date: DateTime.now(),
      from: "VLD",
      to: "MSC",
      flightNumber: 1479,
      aircraft: 320,
      economyPrice: 250,
      buisnessPrice: 350,
      firstClassPrice: 550,
      status: FlightStatus.allowed,
      transefCount: 0,
      scheduleIds: [],
    ),
    Flight(
      date: DateTime.now(),
      from: "VLD",
      to: "MSC",
      flightNumber: 1479,
      aircraft: 320,
      economyPrice: 250,
      buisnessPrice: 350,
      firstClassPrice: 550,
      status: FlightStatus.canceled,
      transefCount: 0,
      scheduleIds: [],
    ),
    Flight(
      date: DateTime.now(),
      from: "VLD",
      to: "MSC",
      flightNumber: 1479,
      aircraft: 320,
      economyPrice: 250,
      buisnessPrice: 350,
      firstClassPrice: 550,
      status: FlightStatus.canceled,
      transefCount: 0,
      scheduleIds: [],
    )
  ];

  @override
  Widget build(BuildContext context) {
    const double formFieldWidth = 200;
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(
                top: appPaddingLarge,
                right: appPaddingLarge,
                left: appPaddingLarge,
              ),
              child: Filter(
                formFieldWidth: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(appPaddingLarge),
              child: Divider(
                thickness: 2,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: appPaddingLarge),
                child: FlightsList(
                  flights: mockFlights.asObservable(),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(appPaddingMedium),
              child: ActionRow(),
            ),
          ],
        ),
      ),
    );
  }
}
