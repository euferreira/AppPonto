import 'package:app_ponto/src/modules/ponto/domain/entity/ponto.entity.dart';
import 'package:dartz/dartz.dart';

abstract class IPontoRepository {
  Future<Either<Fail, PontoEntity>> getPonto(PontoParam params);

  Future<Either<Fail, PontoEntity>> savePonto(PontoParam params);
}
