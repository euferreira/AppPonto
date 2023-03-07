import '../domain/entity/ponto.entity.dart';

abstract class IPontoHiveDatasource {
  Future<PontoEntity?> getPonto(PontoParam params);

  Future<PontoEntity?> savePonto(PontoParam ponto);
}

abstract class IPontoDioDatasource {
  Future<PontoEntity?> getPonto(PontoParam params);

  Future<PontoEntity?> savePonto(PontoParam ponto);
}
