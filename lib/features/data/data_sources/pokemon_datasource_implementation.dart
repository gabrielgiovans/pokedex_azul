import 'package:pokedex_azul/core/errors/exceptions.dart';
import 'package:pokedex_azul/features/data/data_sources/endpoints/endpoints.dart';
import 'package:pokedex_azul/features/data/data_sources/pokemon_datasource.dart';
import 'package:pokedex_azul/features/data/models/first_generation_model.dart';
import 'package:pokedex_azul/features/data/models/pokemon_model.dart';

import '../../../core/dio_client/dio_client.dart';

class PokemonDatasourceImplementation implements IPokemonDatasource {
  final IDioClient client;

  PokemonDatasourceImplementation({required this.client});
  @override
  Future<PokemonModel> getPokemonByIndex(int index) async {
    if (index < 0) {
      throw ServerException();
    }

    DioResponse response = await client.get(
      PokedexEndpoints.pokemon(
        index.toString(),
      ),
    );
    if (response.statusCode == 200) {
      return PokemonModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<FirstGenerationModel> getFirstGenerationPokemons() async {
    DioResponse response = await client.get(
      PokedexEndpoints.firstGeneration(),
    );
    if (response.statusCode == 200) {
      return FirstGenerationModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
