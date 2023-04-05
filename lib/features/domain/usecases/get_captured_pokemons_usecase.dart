import 'package:dartz/dartz.dart';
import 'package:pokedex_azul/features/domain/entities/captured_pokemons_entity.dart';
import 'package:pokedex_azul/features/domain/repositories/captured_pokemons_repository.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase.dart';

class GetCapturedPokemonsUsecase
    implements Usecase<CapturedPokemonsEntity, NoParams> {
  final ICapturedPokemonsRepository _repository;

  const GetCapturedPokemonsUsecase(this._repository);
  @override
  Future<Either<Failure, CapturedPokemonsEntity>> call(noParams) async {
    return await _repository.getCapturedPokemons();
  }
}
