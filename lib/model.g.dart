// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserdataAdapter extends TypeAdapter<Userdata> {
  @override
  final int typeId = 1;

  @override
  Userdata read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Userdata(
      name: fields[0] as String,
      createdDate: fields[1] as DateTime,
      age: fields[2] as int,
      phonenumber: fields[3] as int,
      height: fields[4] as int,
      weight: fields[5] as int,
      bodymass: fields[6] as int,
      pressure: fields[7] as int,
      blood: fields[8] as int,
      disease: fields[9] as int,
      medicine: fields[10] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Userdata obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.createdDate)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.phonenumber)
      ..writeByte(4)
      ..write(obj.height)
      ..writeByte(5)
      ..write(obj.weight)
      ..writeByte(6)
      ..write(obj.bodymass)
      ..writeByte(7)
      ..write(obj.pressure)
      ..writeByte(8)
      ..write(obj.blood)
      ..writeByte(9)
      ..write(obj.disease)
      ..writeByte(10)
      ..write(obj.medicine);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserdataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
