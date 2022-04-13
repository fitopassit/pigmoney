// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataAdapter extends TypeAdapter<Data> {
  @override
  final int typeId = 0;

  @override
  Data read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Data()
      ..name = fields[0] as String
      ..cost = fields[1] as double
      ..color = fields[2] as String
      ..percent = fields[3] as double;
  }

  @override
  void write(BinaryWriter writer, Data obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.cost)
      ..writeByte(2)
      ..write(obj.color)
      ..writeByte(3)
      ..write(obj.percent);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// class BalanceAdapter extends TypeAdapter<Balance> {
//   @override
//   final int typeId = 1;

//   @override
//   Balance read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return Balance()..balance = fields[0] as double;
//   }

//   @override
//   void write(BinaryWriter writer, Balance obj) {
//     writer
//       ..writeByte(1)
//       ..writeByte(0)
//       ..write(obj.balance);
//   }

//   @override
//   int get hashCode => typeId.hashCode;

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is BalanceAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }

class DataPieAdapter extends TypeAdapter<DataPie> {
  @override
  final int typeId = 2;

  @override
  DataPie read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataPie()
      ..name = fields[0] as String
      ..cost = fields[1] as double
      ..color = fields[2] as String
      ..percent = fields[3] as double;
  }

  @override
  void write(BinaryWriter writer, DataPie obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.cost)
      ..writeByte(2)
      ..write(obj.color)
      ..writeByte(3)
      ..write(obj.percent);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataPieAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
