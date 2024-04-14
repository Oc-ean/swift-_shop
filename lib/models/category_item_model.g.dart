// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryItemModelAdapter extends TypeAdapter<CategoryItemModel> {
  @override
  final int typeId = 2;

  @override
  CategoryItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryItemModel(
      id: fields[0] as String,
      category: fields[1] as CategoryModel,
      itemName: fields[2] as String,
      itemImage: fields[3] as String,
      itemPrice: fields[4] as double,
      itemDescription: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryItemModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.itemName)
      ..writeByte(3)
      ..write(obj.itemImage)
      ..writeByte(4)
      ..write(obj.itemPrice)
      ..writeByte(5)
      ..write(obj.itemDescription);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
