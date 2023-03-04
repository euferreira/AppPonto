import 'package:app_ponto/src/modules/ponto/domain/entity/ponto.entity.dart';
import 'package:app_ponto/src/modules/ponto/infra/iponto.datasource.dart';
import 'package:dartz/dartz.dart';

import '../../domain/iponto.repository.dart';

class PontoRepository implements IPontoRepository {
  final IPontoDioDatasource dioDatasource;
  final IPontoHiveDatasource hiveDatasource;

  PontoRepository({
    required this.dioDatasource,
    required this.hiveDatasource,
  });

  @override
  Future<Either<Fail, PontoEntity>> getPonto(PontoParam params) async {
    try {
      if (params.isLogged) {
        final result = await dioDatasource.getPonto(params);
        if (result != null) {
          return Right(result);
        }
        return Left(Fail('Não foi possível obter o ponto'));
      }
      final result = await hiveDatasource.getPonto(params);
      if (result != null) {
        return Right(result);
      }
      return Left(Fail('Não foi possível obter o ponto'));
    } catch (e) {
      return Left(Fail(e.toString()));
    }
  }
}
