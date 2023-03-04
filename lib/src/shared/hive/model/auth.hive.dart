import 'package:app_ponto/src/shared/hive/hive.config.dart';
import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: HiveId.auth)
class AuthHive extends HiveObject {
  @HiveField(0)
  String token;

  @HiveField(1, defaultValue: null)
  String? email;

  @HiveField(2, defaultValue: null)
  String? password;

  AuthHive({required this.token, this.email, this.password});
}
