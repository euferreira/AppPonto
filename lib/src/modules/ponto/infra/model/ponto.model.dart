import '../../../../shared/hive/model/ponto.hive.dart';
import '../../domain/entity/ponto.entity.dart';

class PontoModel extends PontoEntity {
  PontoModel({
    super.entrada1,
    super.saida1,
    super.entrada2,
    super.saida2,
    super.sugestaoInicioAlmoco,
    super.sugestaoFimAlmoco,
    super.sugestaoInicioJornada,
    super.sugestaoFimJornada,
  });

  factory PontoModel.fromHive(PontoHive hive) {
    return PontoModel(
      entrada1: hive.entrada1,
      saida1: hive.saida1,
      entrada2: hive.entrada2,
      saida2: hive.saida2,
      sugestaoInicioAlmoco: hive.sugestaoInicioAlmoco,
      sugestaoFimAlmoco: hive.sugestaoFimAlmoco,
      sugestaoInicioJornada: hive.sugestaoInicioJornada,
      sugestaoFimJornada: hive.sugestaoFimJornada,
    );
  }
}
