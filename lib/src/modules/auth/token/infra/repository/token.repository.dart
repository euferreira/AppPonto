import 'package:app_ponto/src/modules/auth/token/domain/entity/token.entity.dart';
import 'package:app_ponto/src/modules/auth/token/infra/itoken.datasource.dart';
import 'package:dartz/dartz.dart';

import '../../domain/itoken.repository.dart';

class TokenRepository implements ITokenRepository {
  final ITokenDatasource datasource;

  TokenRepository(this.datasource);

  @override
  Future<Either<Fail, TokenEntity>> getToken() async {
    try {
      final result = await datasource.getToken();
      return Right(result);
    } catch (e) {
      return Left(Fail(e.toString()));
    }
  }

  @override
  Future<Either<Fail, bool>> setToken(String token) async {
    try {
      final result = await datasource.setToken(token);
      return Right(result);
    } catch (e) {
      return Left(Fail(e.toString()));
    }
  }
}
