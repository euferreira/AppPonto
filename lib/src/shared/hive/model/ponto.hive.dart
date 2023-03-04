import 'package:app_ponto/src/shared/hive/hive.config.dart';
import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: HiveId.ponto)
class PontoHive extends HiveObject {
  @HiveField(0)
  DateTime entrada1;

  @HiveField(1)
  DateTime saida1;

  @HiveField(2)
  DateTime entrada2;

  @HiveField(3)
  DateTime saida2;

  @HiveField(4)
  DateTime? sugestaoInicioAlmoco;

  @HiveField(5)
  DateTime? sugestaoFimAlmoco;

  @HiveField(6)
  DateTime? sugestaoInicioJornada;

  @HiveField(7)
  DateTime? sugestaoFimJornada;

  PontoHive({
    required this.entrada1,
    required this.saida1,
    required this.entrada2,
    required this.saida2,
    this.sugestaoInicioAlmoco,
    this.sugestaoFimAlmoco,
    this.sugestaoInicioJornada,
    this.sugestaoFimJornada,
  });
}
