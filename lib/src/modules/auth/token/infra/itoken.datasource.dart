import 'package:app_ponto/src/modules/auth/token/domain/entity/token.entity.dart';

abstract class ITokenDatasource {
  Future<TokenEntity> getToken();
  Future<bool> setToken(String token);
}
