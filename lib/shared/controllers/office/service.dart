import 'package:chopper/chopper.dart';

part '../../../gen/shared/controllers/office/service.chopper.dart';

@ChopperApi()
abstract class OfficeService extends ChopperService {
  @Get(path: 'office/view')
  Future<Response> getOffices();

  static OfficeService create([ChopperClient? client]) =>
      _$OfficeService(client);
}
