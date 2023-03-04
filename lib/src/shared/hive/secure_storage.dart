import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class ISecureStorage {
  Future<String?> read({required String key});

  Future<void> write({required String key, required String? value});
}

class SecureStorage implements ISecureStorage {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  static const String key = 'SECURE_STORAGE_KEY';

  @override
  Future<String?> read({required String key}) async {
    return await _storage.read(key: key);
  }

  @override
  Future<void> write({required String key, required String? value}) async {
    await _storage.write(key: key, value: value);
  }
}
