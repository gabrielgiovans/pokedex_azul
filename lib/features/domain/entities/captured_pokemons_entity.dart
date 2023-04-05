import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'captured_pokemons_entity.g.dart';

@HiveType(typeId: 0)
class CapturedPokemonsEntity extends Equatable {
  @HiveField(0)
  final List<CapturedPokemonEntity> pokemonslist;

  const CapturedPokemonsEntity(this.pokemonslist);
  @override
  List<Object?> get props => [pokemonslist];
}

@HiveType(typeId: 1)
class CapturedPokemonEntity extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;

  const CapturedPokemonEntity({required this.id, required this.name});
  @override
  List<Object?> get props => [id, name];
}
