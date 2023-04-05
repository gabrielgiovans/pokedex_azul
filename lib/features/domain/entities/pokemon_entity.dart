import 'package:equatable/equatable.dart';

class PokemonEntity extends Equatable {
  final int height;
  final int id;
  final String locationAreaEncounters;
  final String name;
  final int order;
  final SpritesEntity sprites;
  final List<StatsEntity> stats;
  final List<TypesEntity> types;
  final int weight;

  const PokemonEntity(
      {required this.height,
      required this.id,
      required this.locationAreaEncounters,
      required this.name,
      required this.order,
      required this.sprites,
      required this.stats,
      required this.types,
      required this.weight});

  @override
  List<Object?> get props => [
        height,
        id,
        locationAreaEncounters,
        name,
        order,
        sprites,
        stats,
        types,
        weight
      ];
}

class SpritesEntity extends Equatable {
  final OtherEntity other;

  const SpritesEntity({required this.other});

  @override
  List<Object?> get props => [other];
}

class OtherEntity extends Equatable {
  final DreamWorldEntity dreamWorld;

  const OtherEntity({
    required this.dreamWorld,
  });

  @override
  List<Object?> get props => [dreamWorld];
}

class DreamWorldEntity extends Equatable {
  final String frontDefault;

  const DreamWorldEntity({required this.frontDefault});

  @override
  List<Object?> get props => [frontDefault];
}

class StatEntity extends Equatable {
  final String name;
  final String url;

  const StatEntity({required this.name, required this.url});

  @override
  List<Object?> get props => [name, url];
}

class StatsEntity extends Equatable {
  final int baseStat;
  final int effort;
  final StatEntity stat;

  const StatsEntity({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  @override
  List<Object?> get props => [baseStat, effort, stat];
}

class TypeEntity extends Equatable {
  final String name;
  final String url;

  const TypeEntity({required this.name, required this.url});

  @override
  List<Object?> get props => [name, url];
}

class TypesEntity extends Equatable {
  final int slot;
  final TypeEntity type;

  const TypesEntity({required this.slot, required this.type});

  @override
  List<Object?> get props => [slot, type];
}
