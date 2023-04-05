import 'package:pokedex_azul/features/domain/entities/pokemon_entity.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:pokedex_azul/features/domain/usecases/get_pokemon_from_index_usecase.dart';

class PokemonController extends Store<PokemonEntity> {
  final GetPokemonFromIndexUsecase _getPokemonFromIndexUsecase;
  PokemonController(this._getPokemonFromIndexUsecase)
      : super(
          const PokemonEntity(
            height: 20,
            id: 1,
            locationAreaEncounters: '',
            name: '',
            order: 1,
            sprites: SpritesEntity(
              other: OtherEntity(
                dreamWorld: DreamWorldEntity(frontDefault: ''),
              ),
            ),
            stats: <StatsEntity>[],
            types: <TypesEntity>[],
            weight: 0,
          ),
        );

  getPokemonFromIndex(int index) async {
    setLoading(true);
    final result = await _getPokemonFromIndexUsecase(index);
    result.fold(
      (error) => setError(error),
      (success) => update(success),
    );
    setLoading(false);
  }
}
