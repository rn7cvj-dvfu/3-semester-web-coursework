import 'package:chopper/chopper.dart';
import 'package:web_susch/shared/controllers/flights/service.dart';
import 'package:web_susch/shared/models/flight.dart';

class FlightsConverter {
  final FlightService _flightService;

  FlightsConverter({required FlightService flightService})
      : _flightService = flightService;

  Future<FlightsResponse> getFlights(
    String departureAirportCode,
    String arrivalAirportCode,
    DateTime dateTo,
  ) async {
    Response response;

    try {
      response = await _flightService.getFlights(
        departureAirportCode,
        arrivalAirportCode,
        'to',
        dateTo.toString().substring(0, 10),
        dateTo.add(Duration(days: 1)).toString().substring(0, 10),
      );
    } catch (e) {
      return FlightsResponse(
        isSuccessful: false,
        flights: null,
      );
    }

    if (!response.isSuccessful) {
      return FlightsResponse(
        isSuccessful: false,
        flights: null,
      );
    }

    return FlightsResponse(
      isSuccessful: true,
      flights: _parseFlights(response),
    );
  }

  List<Flight> _parseFlights(Response response) {
    List<dynamic> flights = response.body['to'] as List;

    return flights
        .map((flight) => Flight(
              date: DateTime.parse(flight["Date"]),
              from: flight["From"],
              to: flight["To"],
              flightNumber: int.parse(flight["FlightNumbers"][0]),
              aircraft: int.parse(flight["FlightNumbers"][0]),
              economyPrice: flight["EconomyPrice"].toInt(),
              buisnessPrice: flight["BusinessPrice"].toInt(),
              firstClassPrice: flight["FirstClassPrice"].toInt(),
              status: FlightStatus.allowed,
            ))
        .toList();
  }
}

class FlightsResponse {
  final bool isSuccessful;
  final List<Flight>? flights;

  FlightsResponse({
    required this.isSuccessful,
    required this.flights,
  });
}
