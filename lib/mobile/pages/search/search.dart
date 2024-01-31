import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mobx/mobx.dart';
import 'package:web_susch/shared/controllers/di/manager.dart';
import 'package:web_susch/shared/models/flight.dart';
import 'package:web_susch/constants.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';
import 'package:web_susch/shared/controllers/flights/controller.dart';
import 'package:web_susch/mobile/pages/search/widgets/flights_list.dart';
import 'package:web_susch/shared/ui/icon_text_button.dart';

import 'widgets/filters.dart';

class Search extends StatelessWidget {
  Search({super.key});

  final FlightsController _flightsController =
      DIManager.get<FlightsController>();

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.9;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.home.searchFligths),
        forceMaterialTransparency: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Filters(),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(appPaddingSmall),
                  child: Observer(builder: (_) {
                    Widget child = LoadingAnimationWidget.prograssiveDots(
                      color: Theme.of(context).colorScheme.primary,
                      size: 80,
                    );

                    if (!_flightsController.isLoading) {
                      child = FligthList(
                          flights: _flightsController.flights.asObservable());
                    }

                    return child;
                  }),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(appPaddingSmall),
              child: IconTextButton(
                buttonWidth: buttonWidth,
                onTap: _flightsController.getFlights,
                icon: Icon(Icons.search),
                label: t.search.search,
              ),
            )
          ],
        ),
      ),
    );
  }
}
