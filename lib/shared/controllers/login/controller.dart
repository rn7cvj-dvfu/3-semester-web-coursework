import 'package:flutter/painting.dart';
import 'package:mobx/mobx.dart';
import 'package:web_susch/gen/i18n/strings.g.dart';
import 'package:web_susch/shared/controllers/di/manager.dart';
import 'package:web_susch/shared/controllers/login/converter.dart';
import 'package:web_susch/shared/controllers/token/controller.dart';
import 'package:web_susch/logger.dart';

part '../../../gen/shared/controllers/login/controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final LoginConverter _loginConverter;

  final VoidCallback? onSucessfullLogin;
  final VoidCallback? onFailedLogin;

  @observable
  bool isLoading = false;

  LoginControllerBase({
    required LoginConverter loginConverter,
    this.onSucessfullLogin,
    this.onFailedLogin,
  }) : _loginConverter = loginConverter;

  @action
  Future<void> login(String email, String password) async {
    isLoading = true;

    LoginResponse response = await _loginConverter.login(email, password);

    logger.i("Loggin to $email, token: ${response.token}");

    String token = response.token;

    if (token.isNotEmpty) {
      DIManager.get<TokenContoller>().writeNewToken(token);
      onSucessfullLogin?.call();
    }

    if (token.isEmpty) {
      onFailedLogin?.call();
    }

    isLoading = false;
  }
}
