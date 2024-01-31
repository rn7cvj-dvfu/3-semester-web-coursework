import 'package:chopper/chopper.dart';
import 'package:web_susch/shared/controllers/login/service.dart';

class LoginConverter {
  final LoginService _loginService;

  LoginConverter({required LoginService loginService})
      : _loginService = loginService;

  Future<LoginResponse> login(String email, String password) async {
    Response response;
    try {
      response = await _loginService.login(email, password);
    } catch (e) {
      return LoginResponse(token: '', error: e.toString());
    }

    if (response.statusCode == 200) {
      return LoginResponse(token: response.body['token'], error: null);
    }
    return LoginResponse(token: '', error: response.statusCode.toString());
  }
}

class LoginResponse {
  final String token;
  final String? error;

  LoginResponse({required this.token, required this.error});
}
