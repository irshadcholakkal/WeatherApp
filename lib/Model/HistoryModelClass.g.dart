// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HistoryModelClass.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HistoryAdapter extends TypeAdapter<History> {
  @override
  final int typeId = 1;

  @override
  History read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return History(
      place: fields[1] as String?,
      temprature: fields[0] as num?,
      description: fields[2] as String?,
      Date: fields[3] as String?,
      time: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, History obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.temprature)
      ..writeByte(1)
      ..write(obj.place)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.Date)
      ..writeByte(4)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
