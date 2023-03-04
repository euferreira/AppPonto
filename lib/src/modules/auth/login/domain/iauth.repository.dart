import 'entity/auth.entity.dart';

abstract class IAuthRepository {
  Future<AuthEntity> auth(AuthParams params);
}
