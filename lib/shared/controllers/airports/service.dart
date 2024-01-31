import 'package:chopper/chopper.dart';

part '../../../gen/shared/controllers/airports/service.chopper.dart';

@ChopperApi()
abstract class AirportService extends ChopperService {
  @Get(path: 'airport/view')
  Future<Response> getAirports();

  static AirportService create([ChopperClient? client]) =>
      _$AirportService(client);
}
