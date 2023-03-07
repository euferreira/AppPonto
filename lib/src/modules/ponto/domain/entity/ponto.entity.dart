import 'package:app_ponto/src/modules/ponto/domain/entity/ponto.enum.dart';

class PontoEntity {
  DateTime? entrada1;
  DateTime? saida1;
  DateTime? entrada2;
  DateTime? saida2;
  DateTime? sugestaoInicioAlmoco;
  DateTime? sugestaoFimAlmoco;
  DateTime? sugestaoInicioJornada;
  DateTime? sugestaoFimJornada;
  bool? isFeriado;
  bool? isFolga;
  Duration? horasTrabalhadas;
  PontoType? pontoType;

  PontoEntity({
    this.entrada1,
    this.saida1,
    this.entrada2,
    this.saida2,
    this.sugestaoInicioAlmoco,
    this.sugestaoFimAlmoco,
    this.sugestaoInicioJornada,
    this.sugestaoFimJornada,
    this.isFeriado,
    this.isFolga,
    this.horasTrabalhadas,
    this.pontoType,
  });

  PontoEntity makeSuggestions() {
    if (entrada1 != null) {
      sugestaoInicioAlmoco = entrada1!.add(const Duration(hours: 3));
      sugestaoFimAlmoco = entrada1!.add(const Duration(hours: 4));
      sugestaoFimJornada = entrada1!.add(const Duration(hours: 8));
    }
    if (entrada2 != null) {
      sugestaoFimJornada = entrada2!.add(const Duration(hours: 5));
    }

    if (entrada1 != null && saida2 != null) {
      Duration? almoco;

      if (saida1 != null && entrada2 != null) {
        almoco = entrada2!.difference(saida1!);
      }

      horasTrabalhadas = saida2!.difference(entrada1!);
      horasTrabalhadas = almoco != null ? horasTrabalhadas! - almoco : horasTrabalhadas;
    }

    return this;
  }

  bool get validateByType {
    if (pontoType == PontoType.entrada1) {
      return entrada1 != null;
    }
    else if (pontoType == PontoType.saida1) {
      if (entrada1 != null) {
        return saida1 != null && saida1!.isAfter(entrada1!);
      }
      return false;
    }
    else if (pontoType == PontoType.entrada2) {
      if (saida1 != null) {
        return entrada2 != null && entrada2!.isAfter(saida1!);
      }
      return false;
    }
    else if (pontoType == PontoType.saida2) {
      if (entrada2 != null) {
        return saida2 != null && saida2!.isAfter(entrada2!);
      }
      return false;
    }
    else {
      return false;
    }
  }
}

class PontoParam {
  final DateTime data;
  final bool isLogged;
  final PontoEntity? ponto;

  PontoParam({
    required this.data,
    required this.isLogged,
    this.ponto,
  });
}
