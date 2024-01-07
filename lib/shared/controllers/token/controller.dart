import 'package:web_susch/shared/controllers/token/storage.dart';
import 'package:web_susch/logger.dart';

class TokenContoller {
  final TokenStorage _tokenStorage;

  TokenContoller({required TokenStorage tokenStorage})
      : _tokenStorage = tokenStorage;

  String? get token => _token;
  String? _token;

  List<Future<void> Function()> onSuccess = [];
  List<Future<void> Function()> onSuccessAwait = [];

  Future<void> init() async {
    await _tokenStorage.init();

    _token = _tokenStorage.token;

    if (_token != null) {
      logger.i("Restoring token: $_token");
      Future.wait(onSuccess.map((f) => f()));
      await Future.wait(onSuccessAwait.map((f) => f()));
    }
  }

  void writeNewToken(String? token) {
    logger.i("Writing new token: $token");
    _token = token;

    _tokenStorage.writeNewToken(_token);
  }
}
