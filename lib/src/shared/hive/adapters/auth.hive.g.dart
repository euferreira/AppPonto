import 'package:hive/hive.dart';

import '../model/auth.hive.dart';

class AuthHiveAdapter extends TypeAdapter<AuthHive> {
  @override
  final int typeId = 0;

  @override
  AuthHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthHive(
      token: fields[0] as String,
      email: fields[1] as String?,
      password: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AuthHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.token)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is AuthHiveAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
