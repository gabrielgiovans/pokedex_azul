import 'package:pokedex_azul/features/domain/entities/first_generation_entity.dart';
import 'package:pokedex_azul/features/domain/usecases/get_first_generation_pokemons_usecase.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../core/usecase/usecase.dart';

class FirstGenerationController extends Store<FirstGenerationEntity> {
  final GetFirstGenerationPokemonsUsecase _getFirstGenerationPokemonsUsecase;
  FirstGenerationController(this._getFirstGenerationPokemonsUsecase)
      : super(
          const FirstGenerationEntity(
            pokemons: <FirstGenerationPokemonEntity>[],
          ),
        );

  getFirstGenerationPokemons() async {
    setLoading(true);
    final result = await _getFirstGenerationPokemonsUsecase(NoParams());
    result.fold(
      (error) => setError(error),
      (success) => update(success),
    );
    setLoading(false);
  }
}
