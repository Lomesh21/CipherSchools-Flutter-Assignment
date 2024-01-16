// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BalanceAdapter extends TypeAdapter<Balance> {
  @override
  final int typeId = 1;

  @override
  Balance read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Balance(
      total: fields[0] as int,
      income: fields[1] as int,
      expense: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Balance obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.total)
      ..writeByte(1)
      ..write(obj.income)
      ..writeByte(2)
      ..write(obj.expense);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BalanceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
