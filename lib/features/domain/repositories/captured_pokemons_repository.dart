import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../entities/captured_pokemons_entity.dart';

abstract class ICapturedPokemonsRepository {
  Future<Either<Failure, CapturedPokemonsEntity>> getCapturedPokemons();

  Future<Either<Failure, void>> capturePokemon(CapturePokemonParams params);

  Future<Either<Failure, bool>> releasePokemon(int idPokemon);
}
