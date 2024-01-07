import 'package:get_it/get_it.dart';
import 'package:web_susch/shared/controllers/airports/controller.dart';
import 'package:web_susch/shared/controllers/airports/converter.dart';
import 'package:web_susch/shared/controllers/airports/service.dart';
import 'package:web_susch/shared/controllers/flights/controller.dart';
import 'package:web_susch/shared/controllers/flights/converter.dart';
import 'package:web_susch/shared/controllers/flights/service.dart';
import 'package:web_susch/shared/controllers/login/converter.dart';
import 'package:web_susch/shared/controllers/login/service.dart';
import 'package:web_susch/shared/controllers/network/client.dart';
import 'package:web_susch/shared/controllers/office/controller.dart';
import 'package:web_susch/shared/controllers/office/converter.dart';
import 'package:web_susch/shared/controllers/office/service.dart';
import 'package:web_susch/shared/controllers/token/controller.dart';
import 'package:web_susch/shared/controllers/token/storage.dart';
import 'package:web_susch/shared/controllers/users/controller.dart';
import 'package:web_susch/shared/controllers/users/converter.dart';
import 'package:web_susch/shared/controllers/users/service.dart';
import 'package:web_susch/shared/models/airport.dart';
import 'package:web_susch/shared/models/user.dart';

class DIManager {
  static Future<void> init() async {
    LoginConverter loginConverter = LoginConverter(
      loginService: chopper.getService<LoginService>(),
    );

    AirportConverter airportConverter = AirportConverter(
      airportService: chopper.getService<AirportService>(),
    );

    AirportController airportController = AirportController(
      airportConverter: airportConverter,
    );

    OfficeConverter officeConverter = OfficeConverter(
      officeService: chopper.getService<OfficeService>(),
    );

    OfficeController officeController = OfficeController(
      officeConverter: officeConverter,
    );

    FlightsConverter flightsConverter = FlightsConverter(
      flightService: chopper.getService<FlightService>(),
    );

    FlightsController flightsController = FlightsController(
      flightsConverter: flightsConverter,
    );

    UsersConverter usersConverter = UsersConverter(
      usersService: chopper.getService<UsersService>(),
    );

    UsersController usersController = UsersController(
      usersConverter: usersConverter,
    );

    TokenStorage tokenStorage = TokenStorage();
    TokenContoller tokenContoller = TokenContoller(
      tokenStorage: tokenStorage,
    );

    await tokenContoller.init();
    GetIt.I.registerSingleton<TokenContoller>(tokenContoller);

    await airportController.init();
    await officeController.init();

    usersController.getUsers();

    GetIt.I.registerSingleton<LoginConverter>(loginConverter);
    GetIt.I.registerSingleton<AirportController>(airportController);
    GetIt.I.registerSingleton<OfficeController>(officeController);
    GetIt.I.registerSingleton<FlightsController>(flightsController);
    GetIt.I.registerSingleton<UsersController>(usersController);
  }

  static T get<T extends Object>() => GetIt.I<T>();
}
