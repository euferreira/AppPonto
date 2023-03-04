import 'package:hive/hive.dart';

import '../model/ponto.hive.dart';

class PontoHiveAdapter extends TypeAdapter<PontoHive> {
  @override
  final int typeId = 1;

  @override
  PontoHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PontoHive(
      entrada1: fields[0] as DateTime,
      saida1: fields[1] as DateTime,
      entrada2: fields[2] as DateTime,
      saida2: fields[3] as DateTime,
      sugestaoInicioAlmoco: fields[4] as DateTime?,
      sugestaoFimAlmoco: fields[5] as DateTime?,
      sugestaoInicioJornada: fields[6] as DateTime?,
      sugestaoFimJornada: fields[7] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, PontoHive obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.entrada1)
      ..writeByte(1)
      ..write(obj.saida1)
      ..writeByte(2)
      ..write(obj.entrada2)
      ..writeByte(3)
      ..write(obj.saida2)
      ..writeByte(4)
      ..write(obj.sugestaoInicioAlmoco)
      ..writeByte(5)
      ..write(obj.sugestaoFimAlmoco)
      ..writeByte(6)
      ..write(obj.sugestaoInicioJornada)
      ..writeByte(7)
      ..write(obj.sugestaoFimJornada);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PontoHiveAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
