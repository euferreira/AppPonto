import 'ponto.enum.dart';

class PontoEntity {
  final DateTime? entrada1;
  final DateTime? saida1;
  final DateTime? entrada2;
  final DateTime? saida2;
  final DateTime? sugestaoInicioAlmoco;
  final DateTime? sugestaoFimAlmoco;
  final DateTime? sugestaoInicioJornada;
  final DateTime? sugestaoFimJornada;

  PontoEntity({
    this.entrada1,
    this.saida1,
    this.entrada2,
    this.saida2,
    this.sugestaoInicioAlmoco,
    this.sugestaoFimAlmoco,
    this.sugestaoInicioJornada,
    this.sugestaoFimJornada,
  });

  PontoType get type {
    if (entrada1 != null) PontoType.entrada1;
    if (saida1 != null) PontoType.saida1;
    if (entrada2 != null) PontoType.entrada2;
    if (saida2 != null) PontoType.saida2;
    throw Exception('Invalid PontoType');
  }
}

class PontoParam {
  final DateTime data;
  final bool isLogged;

  PontoParam({
    required this.data,
    required this.isLogged,
  });
}
