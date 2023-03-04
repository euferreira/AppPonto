import 'dart:convert';

import 'package:hive/hive.dart';

import 'adapters/auth.hive.g.dart';
import 'model/auth.hive.dart';
import 'secure_storage.dart';

abstract class IHiveConfig {
  void init();

  void collections();

  void adapter();
}

class HiveConfig implements IHiveConfig {
  final ISecureStorage secureStorage;

  HiveConfig(this.secureStorage);

  @override
  Future<void> adapter() async {
    Hive.registerAdapter(AuthHiveAdapter());
  }

  @override
  Future<void> collections() async {
    HiveAesCipher? cipher;
    String? key;

    try {
      key = await secureStorage.read(key: SecureStorage.key);
      if (key == null) {
        await _generateKey();
        key = await secureStorage.read(key: SecureStorage.key);
      }
      cipher = HiveAesCipher(base64Url.decode(key!));
    } catch (e) {
      await _generateKey();
      key = await secureStorage.read(key: SecureStorage.key);
      cipher = HiveAesCipher(base64Url.decode(key!));
    }

    await Hive.openBox<String>(HiveConsts.theme);

    await Hive.openBox<AuthHive>(HiveConsts.auth, encryptionCipher: cipher);
  }

  @override
  Future<void> init() async {
    await adapter();
    await collections();
  }

  Future<void> _generateKey() async {
    final key = Hive.generateSecureKey();
    await secureStorage.write(
      key: SecureStorage.key,
      value: base64UrlEncode(key),
    );
  }
}

class HiveId {
  static const int auth = 0;
  static const int ponto = 1;
}

class HiveConsts {
  static const String theme = "theme";
  static const String auth = "auth";
  static const String ponto = "ponto";
}
