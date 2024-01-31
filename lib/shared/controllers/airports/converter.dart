import 'package:chopper/chopper.dart';
import 'package:web_susch/shared/controllers/airports/service.dart';
import 'package:web_susch/shared/models/airport.dart';

class AirportConverter {
  final AirportService _airportService;

  AirportConverter({required AirportService airportService})
      : _airportService = airportService;

  Future<List<Airport>?> getAirports() async {
    Response response;

    try {
      response = await _airportService.getAirports();
    } catch (e) {
      return null;
    }

    List<Airport> airports = response.body
        .map((airport) => Airport.fromJson(airport))
        .toList()
        .cast<Airport>();

    return airports;
  }
}
