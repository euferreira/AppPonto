import '../domain/entity/auth.entity.dart';

abstract class IAuthDataSource {
  Future<AuthEntity> auth(AuthParams params);
}
