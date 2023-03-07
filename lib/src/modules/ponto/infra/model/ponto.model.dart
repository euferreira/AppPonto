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
    super.isFeriado,
    super.isFolga,
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
      isFeriado: hive.isFeriado,
      isFolga: hive.isFolga,
    );
  }

  static PontoHive toHive(PontoParam param) {
    return PontoHive(
      entrada1: param.ponto!.entrada1,
      saida1: param.ponto!.saida1,
      entrada2: param.ponto!.entrada2,
      saida2: param.ponto!.saida2,
      sugestaoInicioAlmoco: param.ponto!.sugestaoInicioAlmoco,
      sugestaoFimAlmoco: param.ponto!.sugestaoFimAlmoco,
      sugestaoInicioJornada: param.ponto!.sugestaoInicioJornada,
      sugestaoFimJornada: param.ponto!.sugestaoFimJornada,
      isFeriado: param.ponto!.isFeriado,
      isFolga: param.ponto!.isFolga,
    );
  }
}
