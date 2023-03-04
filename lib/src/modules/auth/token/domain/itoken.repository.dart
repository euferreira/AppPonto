import 'package:dartz/dartz.dart';

import 'entity/token.entity.dart';

abstract class ITokenRepository {
  Future<Either<Fail, TokenEntity>> getToken();

  Future<Either<Fail, bool>> setToken(String token);
}
