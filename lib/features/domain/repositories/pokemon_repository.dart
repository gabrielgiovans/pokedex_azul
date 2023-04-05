import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../entities/first_generation_entity.dart';
import '../entities/pokemon_entity.dart';

abstract class IPokemonRepository {
  Future<Either<Failure, PokemonEntity>> getPokemonByIndex(int index);
  Future<Either<Failure, FirstGenerationEntity>> getFirstGenerationPokemons();
}
