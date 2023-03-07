import 'package:app_ponto/src/modules/ponto/domain/entity/ponto.entity.dart';
import 'package:app_ponto/src/modules/ponto/infra/iponto.datasource.dart';
import 'package:app_ponto/src/shared/hive/model/ponto.hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../shared/hive/hive.config.dart';
import '../model/ponto.model.dart';

class PontoHiveDatasource implements IPontoHiveDatasource {
  @override
  Future<PontoEntity?> getPonto(PontoParam param) async {
    final box = Hive.box<PontoHive>(HiveConsts.ponto);
    final ponto = box.get(DateTime(param.data.year, param.data.month, param.data.day).toString());
    if (ponto != null) {
      return PontoModel.fromHive(ponto);
    }
    return null;
  }

  @override
  Future<PontoEntity?> savePonto(PontoParam param) async {
    final box = Hive.box<PontoHive>(HiveConsts.ponto);
    final pontoHive = PontoModel.toHive(param);
    await box.put(DateTime(param.data.year, param.data.month, param.data.day).toString(), pontoHive);

    return PontoModel.fromHive(pontoHive);
  }
}
