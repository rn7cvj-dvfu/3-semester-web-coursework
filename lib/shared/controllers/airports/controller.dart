import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:web_susch/shared/controllers/airports/converter.dart';
import 'package:web_susch/shared/models/airport.dart';
import 'package:web_susch/logger.dart';

part '../../../gen/shared/controllers/airports/controller.g.dart';

class AirportController = AirportControllerBase with _$AirportController;

abstract class AirportControllerBase with Store {
  final AirportConverter airportConverter;

  AirportControllerBase({required this.airportConverter});

  @observable
  bool isLoading = false;

  List<Airport> airports = [];

  Airport? fromAirportFilter;
  Airport? toAirportFilter;

  @action
  Future<void> init() async {
    isLoading = true;

    List<Airport>? response = await airportConverter.getAirports();

    if (response != null) {
      String prettyResponse =
          const JsonEncoder.withIndent('    ').convert(response);

      logger.i("Loaded Airports: $prettyResponse");

      airports = response;
    }

    isLoading = false;
  }
}
