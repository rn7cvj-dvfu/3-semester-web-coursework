import 'package:chopper/chopper.dart';
import 'package:web_susch/shared/controllers/addFlights/service.dart';
import 'package:web_susch/shared/controllers/airports/service.dart';
import 'package:web_susch/shared/controllers/flights/service.dart';
import 'package:web_susch/shared/controllers/login/service.dart';
import 'package:web_susch/shared/controllers/network/authenticator.dart';
import 'package:web_susch/shared/controllers/network/interceptor.dart';
import 'package:web_susch/shared/controllers/office/service.dart';
import 'package:web_susch/shared/controllers/users/service.dart';

ChopperClient chopper = ChopperClient(
  baseUrl: Uri.parse("https://websusch.poslam.ru/api"),
  interceptors: [
    // authInterceptor,
    // localeInterceptors,
    loggerRequestInterceptor,
  ],
  services: [
    LoginService.create(),
    AirportService.create(),
    OfficeService.create(),
    FlightService.create(),
    UsersService.create(),
    AddFlightService.create(),
  ],
  authenticator: TokenAuthenticator(),
  converter: const JsonConverter(),
);
