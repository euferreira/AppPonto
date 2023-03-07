import 'package:app_ponto/src/modules/ponto/domain/entity/ponto.entity.dart';
import 'package:app_ponto/src/modules/ponto/infra/iponto.datasource.dart';

class PontoDioDatasource implements IPontoDioDatasource {
  @override
  Future<PontoEntity?> getPonto(PontoParam params) {
    // TODO: implement getPonto
    throw UnimplementedError();
  }

  @override
  Future<PontoEntity?> savePonto(PontoParam ponto) {
    // TODO: implement savePonto
    throw UnimplementedError();
  }
}
