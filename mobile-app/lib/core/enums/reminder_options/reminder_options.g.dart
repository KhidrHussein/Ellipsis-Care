// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_options.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReminderIntervalAdapter extends TypeAdapter<ReminderInterval> {
  @override
  final int typeId = 4;

  @override
  ReminderInterval read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ReminderInterval.daily;
      case 1:
        return ReminderInterval.twice;
      case 2:
        return ReminderInterval.thrice;
      default:
        return ReminderInterval.daily;
    }
  }

  @override
  void write(BinaryWriter writer, ReminderInterval obj) {
    switch (obj) {
      case ReminderInterval.daily:
        writer.writeByte(0);
        break;
      case ReminderInterval.twice:
        writer.writeByte(1);
        break;
      case ReminderInterval.thrice:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReminderIntervalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ReminderScheduleAdapter extends TypeAdapter<ReminderSchedule> {
  @override
  final int typeId = 5;

  @override
  ReminderSchedule read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ReminderSchedule.morning;
      case 1:
        return ReminderSchedule.afternoon;
      case 2:
        return ReminderSchedule.evening;
      default:
        return ReminderSchedule.morning;
    }
  }

  @override
  void write(BinaryWriter writer, ReminderSchedule obj) {
    switch (obj) {
      case ReminderSchedule.morning:
        writer.writeByte(0);
        break;
      case ReminderSchedule.afternoon:
        writer.writeByte(1);
        break;
      case ReminderSchedule.evening:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReminderScheduleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ReminderInstructionAdapter extends TypeAdapter<ReminderInstruction> {
  @override
  final int typeId = 6;

  @override
  ReminderInstruction read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ReminderInstruction.beforeMeal;
      case 1:
        return ReminderInstruction.afterMeal;
      default:
        return ReminderInstruction.beforeMeal;
    }
  }

  @override
  void write(BinaryWriter writer, ReminderInstruction obj) {
    switch (obj) {
      case ReminderInstruction.beforeMeal:
        writer.writeByte(0);
        break;
      case ReminderInstruction.afterMeal:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReminderInstructionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ReminderTypeAdapter extends TypeAdapter<ReminderType> {
  @override
  final int typeId = 7;

  @override
  ReminderType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ReminderType.food;
      case 1:
        return ReminderType.drug;
      default:
        return ReminderType.food;
    }
  }

  @override
  void write(BinaryWriter writer, ReminderType obj) {
    switch (obj) {
      case ReminderType.food:
        writer.writeByte(0);
        break;
      case ReminderType.drug:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReminderTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
