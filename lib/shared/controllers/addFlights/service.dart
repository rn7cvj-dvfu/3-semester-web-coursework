import 'package:chopper/chopper.dart';

part '../../../gen/shared/controllers/addFlights/service.chopper.dart';

@ChopperApi()
abstract class AddFlightService extends ChopperService {
  @Get(path: 'addflight/view')
  Future<Response> addFlightGet(
    @Query('departure_airport_ids') int departureAirportId,
    @Query("arrival_airport_ids") int arrivalAirportId,
  );

  @Post(path: 'addflight/create')
  Future<Response> createFlight(
    @Field('departure_airport_code') String departureAirportCode,
    @Field('arrival_airport_code') String arrivalAirportCode,
    @Field('flight_number') int flightNumber,
    @Field('aircraft_model') String aircraftModel,
    @Field('economy_price') String economyPrice,
    @Field('buisness_price') String buisnessPrice,
    @Field('first_class_price') String firstClassPrice,
  );

  static AddFlightService create([ChopperClient? client]) =>
      _$AddFlightService(client);
}