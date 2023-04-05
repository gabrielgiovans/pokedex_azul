import 'package:pokedex_azul/core/errors/failures.dart';

import 'package:dartz/dartz.dart';
import 'package:pokedex_azul/features/domain/repositories/captured_pokemons_repository.dart';

import '../../../core/usecase/usecase.dart';

class ReleasePokemonUsecase extends Usecase<void, int> {
  final ICapturedPokemonsRepository _repository;

  ReleasePokemonUsecase(this._repository);
  @override
  Future<Either<Failure, bool>> call(int params) async {
    return await _repository.releasePokemon(params);
  }
}
