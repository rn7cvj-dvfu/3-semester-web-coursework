import 'package:get_storage/get_storage.dart';

class TokenStorage {
  late GetStorage _box;

  static const String _boxName = "tokenBox";

  String? get token => _token;
  String? _token;
  static const String _tokenName = "token";

  Future<void> init() async {
    await GetStorage.init(_boxName);
    _box = GetStorage(_boxName);

    _token = _box.read(_tokenName);
    // _refreshToken = _box.read(_refreshTokenName);

    // if (_token != null) _tryToValidateToken();
  }

  Future<void> writeNewToken(String? token) async {
    _token = token;
    // _refreshToken = refreshToken;

    await _box.write(_tokenName, _token);
    // await _box.write(_refreshTokenName, _refreshToken);
  }
}
