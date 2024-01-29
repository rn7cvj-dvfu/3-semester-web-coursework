import 'package:chopper/chopper.dart';
import 'package:web_susch/shared/controllers/addFlights/service.dart';
import 'package:web_susch/shared/models/flight.dart';

class AddFlightConverter {
  final AddFlightService _addFlightService;

  AddFlightConverter({required AddFlightService addFlightService})
      : _addFlightService = addFlightService;
  
  Future<AddFlightResponse> addFlightGet(
    int departureAirportId,
    int arrivalAirportId,
  ) async {
    Response response;

    try {
      response = await _addFlightService.addFlightGet(departureAirportId, arrivalAirportId);
    } catch (e) {
      return AddFlightResponse(
        isSuccessful: false,
        flights: null,
      );
    }

    if (!response.isSuccessful) {
      return AddFlightResponse(
        isSuccessful: false,
        flights: null,
      );
    }

    return AddFlightResponse(
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

class AddFlightResponse {
  final bool isSuccessful;
  final List<Flight>? flights;

  AddFlightResponse({
    required this.isSuccessful,
    required this.flights,
  });
}