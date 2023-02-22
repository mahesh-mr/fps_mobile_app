// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_local_storage.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeLocalStorageAdapter extends TypeAdapter<HomeLocalStorage> {
  @override
  final int typeId = 0;

  @override
  HomeLocalStorage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeLocalStorage(
      district: fields[0] as String,
      taluk: fields[1] as String,
      firka: fields[2] as String,
      fpsNo: fields[3] as String,
      lastInDate: fields[4] as String,
      inspectionDate: fields[7] as String?,
      prInspector: fields[5] as String?,
      prPosiction: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HomeLocalStorage obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.district)
      ..writeByte(1)
      ..write(obj.taluk)
      ..writeByte(2)
      ..write(obj.firka)
      ..writeByte(3)
      ..write(obj.fpsNo)
      ..writeByte(4)
      ..write(obj.lastInDate)
      ..writeByte(5)
      ..write(obj.prInspector)
      ..writeByte(6)
      ..write(obj.prPosiction)
      ..writeByte(7)
      ..write(obj.inspectionDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeLocalStorageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
