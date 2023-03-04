import 'package:app_ponto/src/modules/auth/token/domain/entity/token.entity.dart';
import 'package:app_ponto/src/shared/hive/hive.config.dart';
import 'package:hive/hive.dart';

import '../../../../../shared/hive/model/auth.hive.dart';
import '../itoken.datasource.dart';
import '../model/token.model.dart';

class TokenDatasource implements ITokenDatasource {
  @override
  Future<TokenEntity> getToken() async {
    final box = Hive.box<AuthHive>(HiveConsts.auth);
    final auth = box.get('auth');
    if (auth != null) {
      return TokenModel.fromHive(auth);
    }
    throw Exception('Token não encontrado');
  }

  @override
  Future<bool> setToken(String token) async {
    final box = Hive.box<AuthHive>(HiveConsts.auth);
    final auth = box.get('auth');
    if (auth != null) {
      auth.token = token;
      await box.put('auth', auth);
      return true;
    }
    throw Exception('Token não encontrado');
  }
}
