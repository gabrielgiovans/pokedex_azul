import 'package:pokedex_azul/core/errors/failures.dart';

import 'package:dartz/dartz.dart';

import '../../../core/usecase/usecase.dart';
import '../entities/first_generation_entity.dart';
import '../repositories/pokemon_repository.dart';

class GetFirstGenerationPokemonsUsecase
    implements Usecase<FirstGenerationEntity, NoParams> {
  final IPokemonRepository _repository;

  const GetFirstGenerationPokemonsUsecase(this._repository);
  @override
  Future<Either<Failure, FirstGenerationEntity>> call(noParams) async {
    return await _repository.getFirstGenerationPokemons();
  }
}
