import 'package:pokedex_azul/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:pokedex_azul/core/usecase/usecase.dart';
import 'package:pokedex_azul/features/domain/entities/pokemon_entity.dart';

import '../repositories/pokemon_repository.dart';

class GetPokemonFromIndexUsecase implements Usecase<PokemonEntity, int> {
  final IPokemonRepository _repository;

  GetPokemonFromIndexUsecase(this._repository);

  @override
  Future<Either<Failure, PokemonEntity>> call(int index) async {
    return await _repository.getPokemonByIndex(index);
  }
}
