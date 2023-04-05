// ignore_for_file: must_be_immutable

import 'package:pokedex_azul/features/domain/entities/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  const PokemonModel({
    required int height,
    required int id,
    required String locationAreaEncounters,
    required String name,
    required int order,
    required int weight,
    required SpritesEntity sprites,
    required List<StatsEntity> stats,
    required List<TypesEntity> types,
  }) : super(
          height: height,
          id: id,
          locationAreaEncounters: locationAreaEncounters,
          name: name,
          order: order,
          weight: weight,
          sprites: sprites,
          stats: stats,
          types: types,
        );

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    var stats = <StatsEntity>[];
    json['stats'].forEach((stat) {
      stats.add(
        StatsEntity(
          baseStat: stat['base_stat'],
          effort: stat['effort'],
          stat: StatEntity(
            name: stat['stat']['name'],
            url: stat['stat']['url'],
          ),
        ),
      );
    });

    var types = <TypesEntity>[];
    json['types'].forEach((type) {
      types.add(
        TypesEntity(
          slot: type['slot'],
          type: TypeEntity(
            name: type['type']['name'],
            url: type['type']['url'],
          ),
        ),
      );
    });

    return PokemonModel(
      height: json['height'],
      id: json['id'],
      locationAreaEncounters: json['location_area_encounters'],
      name: json['name'],
      order: json['order'],
      sprites: SpritesEntity(
        other: OtherEntity(
          dreamWorld: DreamWorldEntity(
            frontDefault: json['sprites']['other']['dream_world']
                ['front_default'],
          ),
        ),
      ),
      stats: stats,
      types: types,
      weight: json['weight'],
    );
  }
}
