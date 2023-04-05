import 'package:pokedex_azul/core/errors/failures.dart';

import 'package:dartz/dartz.dart';
import 'package:pokedex_azul/features/domain/repositories/captured_pokemons_repository.dart';

import '../../../core/usecase/usecase.dart';

class CapturePokemonUsecase extends Usecase<void, CapturePokemonParams> {
  final ICapturedPokemonsRepository _repository;

  CapturePokemonUsecase(this._repository);
  @override
  Future<Either<Failure, void>> call(CapturePokemonParams params) async {
    return await _repository.capturePokemon(params);
  }
}
