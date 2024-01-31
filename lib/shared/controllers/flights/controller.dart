import 'package:mobx/mobx.dart';
import 'package:web_susch/shared/models/flight.dart';
import 'package:web_susch/shared/controllers/flights/converter.dart';

part '../../../gen/shared/controllers/flights/controller.g.dart';

class FlightsController = FlightsControllerBase with _$FlightsController;

abstract class FlightsControllerBase with Store {
  final FlightsConverter flightsConverter;

  FlightsControllerBase({required this.flightsConverter});

  String fromAirportCode = "";
  String toAirportCode = "";
  DateTime date = DateTime.now();

  @observable
  bool isLoading = false;

  @observable
  List<Flight> flights = [];

  @action
  Future<void> getFlights() async {
    isLoading = true;
    FlightsResponse response =
        await flightsConverter.getFlights(fromAirportCode, toAirportCode, date);

    if (response.isSuccessful) {
      flights = response.flights!;
    }

    isLoading = false;
  }
}
