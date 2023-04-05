import 'package:pokedex_azul/features/data/models/first_generation_model.dart';

import '../models/pokemon_model.dart';

abstract class IPokemonDatasource {
  Future<PokemonModel> getPokemonByIndex(int index);
  Future<FirstGenerationModel> getFirstGenerationPokemons();
}
