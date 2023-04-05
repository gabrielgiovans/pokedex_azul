import 'package:flutter/material.dart';
import 'package:pokedex_azul/features/domain/entities/captured_pokemons_entity.dart';
import 'package:pokedex_azul/features/domain/usecases/get_captured_pokemons_usecase.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../core/global_scaffold.dart';
import '../../../core/usecase/usecase.dart';
import '../../domain/usecases/capture_pokemon_usecase.dart';
import '../../domain/usecases/release_pokemon_usecase.dart';

class CapturedPokemonsController extends Store<CapturedPokemonsEntity> {
  final GetCapturedPokemonsUsecase _getCapturedPokemonsUsecase;
  final CapturePokemonUsecase _capturePokemonUsecase;
  final ReleasePokemonUsecase _releasePokemonUsecase;

  CapturedPokemonsController(
    this._getCapturedPokemonsUsecase,
    this._capturePokemonUsecase,
    this._releasePokemonUsecase,
  ) : super(const CapturedPokemonsEntity(<CapturedPokemonEntity>[]));

  getCapturedPokemons() async {
    setLoading(true);
    final result = await _getCapturedPokemonsUsecase(NoParams());
    result.fold(
      (error) => setError(error),
      (success) => update(success, force: true),
    );
    setLoading(false);
  }

  capturePokemon(int idPokemon, String name, BuildContext context) async {
    setLoading(true);
    final result = await _capturePokemonUsecase(CapturePokemonParams(
      idPokemon,
      name,
    ));
    result.fold(
      (error) => setError(error),
      (success) {
        GlobalScaffold.instance.showSnackbar(
          getSnack(
            'You have captured the pokemon',
            const Color(0xFF0E866A),
          ),
        );
        getCapturedPokemons();
        success;
      },
    );
    setLoading(false);
  }

  releasePokemon(int idPokemon) async {
    setLoading(true);
    final result = await _releasePokemonUsecase(idPokemon);
    result.fold(
      (error) => setError(error),
      (success) {
        if (success) {
          GlobalScaffold.instance.showSnackbar(
            getSnack(
              'You have released the pokemon',
              const Color(0xFF0E866A),
            ),
          );
        } else {
          GlobalScaffold.instance.showSnackbar(
            getSnack(
              'you haven\'t caught this pokemon yet',
              const Color(0xFFD43A45),
            ),
          );
        }

        getCapturedPokemons();
        success;
      },
    );
    setLoading(false);
  }

  getSnack(String label, Color color) => SnackBar(
        content: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: color,
      );
}
