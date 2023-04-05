import 'package:pokedex_azul/features/domain/entities/captured_pokemons_entity.dart';

abstract class ICapturedPokemonsDatasource {
  Future<CapturedPokemonsEntity> getCapturedPokemons();
  Future<void> capturePokemon(int id, String name);
  Future<bool> releasePokemon(int id);
}
