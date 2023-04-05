import 'package:pokedex_azul/features/data/models/first_generation_model.dart';

final tFirstGeneration = FirstGenerationModel.fromJson(
  const {
    "results": [
      {"name": "bulbasaur", "url": "https://pokeapi.co/api/v2/pokemon/1/"},
      {"name": "ivysaur", "url": "https://pokeapi.co/api/v2/pokemon/2/"},
      {"name": "venusaur", "url": "https://pokeapi.co/api/v2/pokemon/3/"},
      {"name": "charmander", "url": "https://pokeapi.co/api/v2/pokemon/4/"}
    ]
  },
);
