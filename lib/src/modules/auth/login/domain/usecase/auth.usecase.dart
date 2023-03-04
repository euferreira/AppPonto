import 'package:dartz/dartz.dart';

import '../entity/auth.entity.dart';
import '../iauth.repository.dart';
import '../iauth.usecase.dart';

class AuthUsecase implements IAuthUsecase {
  final IAuthRepository repository;

  AuthUsecase({required this.repository});

  @override
  Future<Either<Fail, AuthEntity>> auth(AuthParams params) async {
    try {
      final result = await repository.auth(params);
      return Right(result);
    } catch (e) {
      return Left(Fail(e.toString()));
    }
  }
}
