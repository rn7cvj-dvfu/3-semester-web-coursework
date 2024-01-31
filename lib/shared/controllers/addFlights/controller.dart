import 'package:mobx/mobx.dart';
import 'package:web_susch/shared/models/flight.dart';
import 'package:web_susch/shared/controllers/addFlights/converter.dart';

part '../../../gen/shared/controllers/addFlights/controller.g.dart';

class AddFlightController = AddFlightControllerBase with _$AddFlightController;

abstract class AddFlightControllerBase with Store {
  final AddFlightConverter addFlightConverter;

  AddFlightControllerBase({required this.addFlightConverter});

  int fromAirportId = 0;
  int toAirportId = 0;

  @observable
  bool isLoading = false;

  @observable
  List<Flight> flights = [];

  @action
  Future<void> addFlightGet() async {
    isLoading = true;
    AddFlightResponse response =
        await addFlightConverter.addFlightGet(fromAirportId, toAirportId);

    if (response.isSuccessful) {
      flights = response.flights!;
    }

    isLoading = false;
  }
}
