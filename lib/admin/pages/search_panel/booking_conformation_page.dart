import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:web_susch/shared/models/passenger.dart';
import 'package:web_susch/admin/pages/search_panel/widgets/action_row_booking.dart';
import 'package:web_susch/admin/pages/search_panel/widgets/filters_booking.dart';
import 'package:web_susch/admin/pages/search_panel/widgets/outbound_flight_details.dart';
import 'package:web_susch/admin/pages/search_panel/widgets/passengers_list.dart';
import 'package:web_susch/admin/pages/search_panel/widgets/return_flight_details.dart';
import 'package:web_susch/constants.dart';
import 'package:web_susch/admin/pages/admin_panel/widgets/text_input.dart';

class BookingConformationPage extends StatelessWidget {
  BookingConformationPage({super.key});

  final List<Passenger> mockPassengers = [
    Passenger(
      firstName: "VLD",
      lastName: "MSC",
      birthdate: "01/01/2000",
      passportNumber: 1014123456,
      passportCountry: "Russia",
      phone: 89145671234,
    ),
    Passenger(
      firstName: "VLD",
      lastName: "MSC",
      birthdate: "01/01/2000",
      passportNumber: 1014123456,
      passportCountry: "Russia",
      phone: 89145671234,
    ),
    Passenger(
      firstName: "VLD",
      lastName: "MSC",
      birthdate: "01/01/2000",
      passportNumber: 1014123456,
      passportCountry: "Russia",
      phone: 89145671234,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    const double formFieldWidth = 200;
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(
                top: appPaddingLarge,
                right: appPaddingLarge,
                left: appPaddingLarge,
              ),
              child: OutboundFlightDetails(
                formFieldWidth: 200,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: appPaddingLarge,
                right: appPaddingLarge,
                left: appPaddingLarge,
              ),
              child: ReturnFlightDetails(
                formFieldWidth: 200,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: appPaddingLarge,
                right: appPaddingLarge,
                left: appPaddingLarge,
              ),
              child: FilterBooking(
                formFieldWidth: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(appPaddingSmall),
              child: Divider(
                thickness: 2,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: appPaddingLarge),
                child: PassengersList(
                  passengers: mockPassengers.asObservable(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(appPaddingSmall),
              child: Divider(
                thickness: 2,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(appPaddingMedium),
              child: ActionRowBooking(),
            ),
          ],
        ),
      ),
    );
  }
}
