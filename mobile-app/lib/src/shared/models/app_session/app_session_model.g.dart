// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_session_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppSessionModelAdapter extends TypeAdapter<AppSessionModel> {
  @override
  final int typeId = 0;

  @override
  AppSessionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppSessionModel(
      isLoggedIn: fields[2] as bool,
      hasUserOnboard: fields[1] as bool,
      hasEnabledDarkMode: fields[0] as bool,
      canPushNotifications: fields[3] as bool,
      canUseEmergencyServices: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, AppSessionModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.hasEnabledDarkMode)
      ..writeByte(1)
      ..write(obj.hasUserOnboard)
      ..writeByte(2)
      ..write(obj.isLoggedIn)
      ..writeByte(3)
      ..write(obj.canPushNotifications)
      ..writeByte(4)
      ..write(obj.canUseEmergencyServices);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppSessionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
