import 'package:pokedex_azul/features/domain/entities/first_generation_entity.dart';

class FirstGenerationModel extends FirstGenerationEntity {
  const FirstGenerationModel({
    required super.pokemons,
  });

  factory FirstGenerationModel.fromJson(Map<String, dynamic> json) {
    var pokemons = <FirstGenerationPokemonEntity>[];

    json['results'].forEach((pokemon) {
      pokemons.add(
        FirstGenerationPokemonEntity(
          name: pokemon['name'],
          url: pokemon['url'],
        ),
      );
    });
    return FirstGenerationModel(pokemons: pokemons);
  }
}
