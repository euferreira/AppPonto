import 'package:app_ponto/src/modules/auth/token/domain/itoken.repository.dart';
import 'package:dartz/dartz.dart';

import 'package:app_ponto/src/modules/auth/token/domain/entity/token.entity.dart';

import '../itoken.usecase.dart';

class TokenUsecase implements ITokenUsecase {
  final ITokenRepository repository;

  TokenUsecase(this.repository);

  @override
  Future<Either<Fail, TokenEntity>> getToken() async {
    try {
      return await repository.getToken();
    } catch (e) {
      return Left(Fail(e.toString()));
    }
  }

  @override
  Future<Either<Fail, bool>> setToken(String token) async {
    try {
      return await repository.setToken(token);
    } catch (e) {
      return Left(Fail(e.toString()));
    }
  }
}
