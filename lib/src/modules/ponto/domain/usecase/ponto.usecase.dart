import 'package:app_ponto/src/modules/ponto/domain/entity/ponto.entity.dart';
import 'package:app_ponto/src/modules/ponto/domain/iponto.usecase.dart';
import 'package:dartz/dartz.dart';

import '../iponto.repository.dart';

class PontoUsecase implements IPontoUsecase {
  final IPontoRepository repository;

  PontoUsecase(this.repository);

  @override
  Future<Either<Fail, PontoEntity>> getPonto(PontoParam params) async {
    return await repository.getPonto(params);
  }
}
