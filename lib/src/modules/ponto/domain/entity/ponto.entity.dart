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
