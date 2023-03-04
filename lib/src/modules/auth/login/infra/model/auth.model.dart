import '../../domain/entity/auth.entity.dart';

class AuthModel extends AuthEntity {
  AuthModel({super.token});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(token: json['token']);
  }
}
