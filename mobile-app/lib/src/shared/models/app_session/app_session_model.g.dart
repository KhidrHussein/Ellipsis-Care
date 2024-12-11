// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_session_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserSessionModelAdapter extends TypeAdapter<UserSessionModel> {
  @override
  final int typeId = 0;

  @override
  UserSessionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserSessionModel(
      isLoggedIn: fields[1] as bool,
      hasUserOnboard: fields[0] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, UserSessionModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.hasUserOnboard)
      ..writeByte(1)
      ..write(obj.isLoggedIn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserSessionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
