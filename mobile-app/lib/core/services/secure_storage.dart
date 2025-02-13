import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const String _accessToken = "access_token";

class SecureStorage {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessToken);
  }

  Future<void> storeAccessToken(String token) async {
    await _storage.write(key: _accessToken, value: token);
    return;
  }

  Future<void> deleteAll() => _storage.deleteAll();
}
