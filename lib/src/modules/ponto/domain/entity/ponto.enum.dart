enum PontoType {
  entrada1,
  saida1,
  entrada2,
  saida2;

  PontoType fromString(String value) {
    switch (value) {
      case 'Entrada 1':
        return PontoType.entrada1;
      case 'Saida 1':
        return PontoType.saida1;
      case 'Entrada 2':
        return PontoType.entrada2;
      case 'Saida 2':
        return PontoType.saida2;
      default:
        throw Exception('Invalid PontoType');
    }
  }
}
