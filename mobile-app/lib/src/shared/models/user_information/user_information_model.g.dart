// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_information_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserInformationModelAdapter extends TypeAdapter<UserInformationModel> {
  @override
  final int typeId = 1;

  @override
  UserInformationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserInformationModel(
      userID: fields[0] as String,
      firstname: fields[2] as String,
      lastname: fields[3] as String,
      photoUrl: fields[5] as String,
      googleOAuthID: fields[6] as String,
      email: fields[1] as String,
      username: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserInformationModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.userID)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.firstname)
      ..writeByte(3)
      ..write(obj.lastname)
      ..writeByte(4)
      ..write(obj.username)
      ..writeByte(5)
      ..write(obj.photoUrl)
      ..writeByte(6)
      ..write(obj.googleOAuthID);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserInformationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
