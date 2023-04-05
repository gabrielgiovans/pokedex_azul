import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_azul/features/data/models/pokemon_model.dart';
import 'package:pokedex_azul/features/domain/entities/pokemon_entity.dart';

import '../../mocks/pokemon_mock.dart';

void main() {
  final tPokemon = PokemonModel.fromJson(pokemonMock);
  test(
    'Should be a subclass of PokemonEntity',
    () {
      //Assert
      expect(tPokemon, isA<PokemonEntity>());
    },
  );

  test('Should return a valid PokemonModel', () {
    //Act
    final pokemon = PokemonModel.fromJson(pokemonMock);
    //Assert
    expect(pokemon, tPokemon);
  });
}
