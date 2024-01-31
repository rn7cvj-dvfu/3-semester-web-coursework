import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mobx/mobx.dart';
import 'package:web_susch/admin/pages/manager_flight/widgets/actions_row.dart';
import 'package:web_susch/admin/pages/manager_flight/widgets/filters.dart';
import 'package:web_susch/constants.dart';
import 'package:web_susch/shared/controllers/addFlights/controller.dart';
import 'package:web_susch/shared/controllers/di/manager.dart';
import 'package:web_susch/shared/controllers/flights/controller.dart';
import 'package:web_susch/shared/controllers/users/controller.dart';
import 'package:web_susch/shared/models/flight.dart';
import 'package:web_susch/admin/pages/admin_panel/widgets/actions_row.dart';
import 'package:web_susch/admin/pages/admin_panel/widgets/text_input.dart';
import 'package:web_susch/admin/pages/admin_panel/widgets/user_action_row.dart';
import 'package:web_susch/admin/pages/manager_flight/widgets/flights_list.dart';

class ManageFlightPanel extends StatelessWidget {
  ManageFlightPanel({super.key});

  final AddFlightController addFlightsController = DIManager.get<AddFlightController>();

  @override
  Widget build(BuildContext context) {
    const double formFieldWidth = 200;
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            // const SizedBox(height: 10),
            // Padding(
            //   padding: const EdgeInsets.only(
            //     top: appPaddingLarge,
            //     right: appPaddingLarge,
            //     left: appPaddingLarge,
            //   ),
            //   child: Filter(
            //     formFieldWidth: 200,
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(appPaddingLarge),
            //   child: Divider(
            //     thickness: 2,
            //     color: Theme.of(context).colorScheme.secondary,
            //   ),
            // ),
            // Expanded(
            //   child: Padding(
            //     padding: const EdgeInsets.all(appPaddingLarge),
            //     child: Observer(builder: (_) {
            //       if (addFlightsController.isLoading) {
            //         return Center(
            //           child: LoadingAnimationWidget.prograssiveDots(
            //             color: Theme.of(context).colorScheme.primary,
            //             size: 80,
            //           ),
            //         );
            //       }

            //       return FlightsList(
            //         flights: addFlightsController.flights.asObservable(),
            //       );
            //     }),
            //   ),
            // ),
            const SizedBox(height: 250),
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
