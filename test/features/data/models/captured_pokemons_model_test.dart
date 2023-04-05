import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_azul/features/domain/entities/captured_pokemons_entity.dart';

import '../../mocks/captured_pokemons_list_mock.dart';

void main() {
  test(
    'Should be a subclass of CapturedPokemonsEntity',
    () {
      expect(tCapturedPokemonsList, isA<CapturedPokemonsEntity>());
    },
  );
}
