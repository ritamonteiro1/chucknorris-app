// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chuck_category_cm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChuckCategoryCMAdapter extends TypeAdapter<ChuckCategoryCM> {
  @override
  final int typeId = 0;

  @override
  ChuckCategoryCM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChuckCategoryCM(
      fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ChuckCategoryCM obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChuckCategoryCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
