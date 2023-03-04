import 'package:app_ponto/src/shared/hive/model/auth.hive.dart';

import '../../domain/entity/token.entity.dart';

class TokenModel extends TokenEntity {
  TokenModel({super.token, super.user});

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(token: json['token']);
  }

  factory TokenModel.fromHive(AuthHive hive) {
    return TokenModel(
      token: hive.token,
      user: hive.email,
    );
  }
}
