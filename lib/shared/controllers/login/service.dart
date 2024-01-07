import 'package:chopper/chopper.dart';

part '../../../gen/shared/controllers/login/service.chopper.dart';

@ChopperApi()
abstract class LoginService extends ChopperService {
  @Post(path: '/auth/login')
  Future<Response> login(@Field() String email, @Field() String password);

  static LoginService create([ChopperClient? client]) => _$LoginService(client);
}
