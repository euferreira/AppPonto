import '../domain/entity/ponto.entity.dart';

abstract class IPontoHiveDatasource {
  Future<PontoEntity?> getPonto(PontoParam params);
}

abstract class IPontoDioDatasource {
  Future<PontoEntity?> getPonto(PontoParam params);
}
