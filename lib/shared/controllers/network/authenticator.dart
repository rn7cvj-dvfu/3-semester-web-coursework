import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:web_susch/shared/controllers/di/manager.dart';
import 'package:web_susch/shared/controllers/token/controller.dart';

class TokenAuthenticator extends Authenticator {
  @override
  FutureOr<Request?> authenticate(Request request, Response response,
      [Request? originalRequest]) {
    if (response.statusCode != 401) return null;

    TokenContoller tokenContoller = DIManager.get<TokenContoller>();

    String newToken = tokenContoller.token ?? "";

    final Map<String, String> updatedHeaders = request.headers;
    updatedHeaders["auth"] = newToken;

    // request.parameters["lang"] = Localizations.localeOf(rootNavigatorKey.currentContext!).languageCode;

    return request.copyWith(headers: updatedHeaders);
  }
}
