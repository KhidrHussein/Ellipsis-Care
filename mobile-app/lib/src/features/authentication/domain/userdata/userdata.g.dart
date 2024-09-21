// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userdata.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDataAdapter extends TypeAdapter<UserData> {
  @override
  final int typeId = 0;

  @override
  UserData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserData(
      enableDarkMode: fields[1] == null ? false : fields[1] as bool,
      showNotifications: fields[0] == null ? true : fields[0] as bool,
      hasViewedOnboarding: fields[2] == null ? false : fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, UserData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.showNotifications)
      ..writeByte(1)
      ..write(obj.enableDarkMode)
      ..writeByte(2)
      ..write(obj.hasViewedOnboarding);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
