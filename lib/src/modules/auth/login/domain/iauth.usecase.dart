import 'package:dartz/dartz.dart';

import 'entity/auth.entity.dart';

abstract class IAuthUsecase {
  Future<Either<Fail, AuthEntity>> auth(AuthParams params);
}
