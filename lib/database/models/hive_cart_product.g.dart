// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_cart_product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveCartProductAdapter extends TypeAdapter<HiveCartProduct> {
  @override
  final int typeId = 1;

  @override
  HiveCartProduct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveCartProduct(
      amount: fields[0] as int,
      product: fields[1] as HiveProduct,
    );
  }

  @override
  void write(BinaryWriter writer, HiveCartProduct obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.amount)
      ..writeByte(1)
      ..write(obj.product);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveCartProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
