import 'package:chopper/chopper.dart';

part '../../../gen/shared/controllers/flights/service.chopper.dart';

@ChopperApi()
abstract class FlightService extends ChopperService {
  @Get(path: 'flight/view')
  Future<Response> getFlights(
    @Query('departure_airport_code') String departureAirportCode,
    @Query('arrival_airport_code') String arrivalAirportCode,
    @Query('mode') String mode,
    @Query('date_to') String dateTo,
    @Query('date_from') String dateFrom,
  );

  static FlightService create([ChopperClient? client]) =>
      _$FlightService(client);
}
