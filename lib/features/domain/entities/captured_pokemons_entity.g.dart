// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'captured_pokemons_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CapturedPokemonsEntityAdapter
    extends TypeAdapter<CapturedPokemonsEntity> {
  @override
  final int typeId = 0;

  @override
  CapturedPokemonsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CapturedPokemonsEntity(
      (fields[0] as List).cast<CapturedPokemonEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, CapturedPokemonsEntity obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.pokemonslist);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CapturedPokemonsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CapturedPokemonEntityAdapter extends TypeAdapter<CapturedPokemonEntity> {
  @override
  final int typeId = 1;

  @override
  CapturedPokemonEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CapturedPokemonEntity(
      id: fields[0] as int,
      name: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CapturedPokemonEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CapturedPokemonEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
