// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReminderModelAdapter extends TypeAdapter<ReminderModel> {
  @override
  final int typeId = 3;

  @override
  ReminderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReminderModel(
      name: fields[0] as String,
      dosage: fields[1] as String,
      type: fields[3] as ReminderType,
      interval: fields[4] as ReminderInterval,
      instruction: fields[5] as ReminderInstruction,
      schedule: (fields[6] as List).cast<ReminderSchedule>(),
      startDate: fields[7] as String,
      endDate: fields[8] as String,
      markAsCompleted: fields[2] as bool,
      createdAt: fields[9] as String,
      updatedAt: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ReminderModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.dosage)
      ..writeByte(2)
      ..write(obj.markAsCompleted)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.interval)
      ..writeByte(5)
      ..write(obj.instruction)
      ..writeByte(6)
      ..write(obj.schedule)
      ..writeByte(7)
      ..write(obj.startDate)
      ..writeByte(8)
      ..write(obj.endDate)
      ..writeByte(9)
      ..write(obj.createdAt)
      ..writeByte(10)
      ..write(obj.updatedAt)
      ..writeByte(11)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReminderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
