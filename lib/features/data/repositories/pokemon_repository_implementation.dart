import 'package:pokedex_azul/features/domain/entities/first_generation_entity.dart';
import 'package:pokedex_azul/features/domain/entities/pokemon_entity.dart';
import 'package:pokedex_azul/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:pokedex_azul/features/domain/repositories/pokemon_repository.dart';

import '../../../core/errors/exceptions.dart';
import '../data_sources/pokemon_datasource.dart';

class PokemonRepositoryImplementation implements IPokemonRepository {
  final IPokemonDatasource _datasource;

  PokemonRepositoryImplementation(this._datasource);

  @override
  Future<Either<Failure, PokemonEntity>> getPokemonByIndex(int index) async {
    try {
      final result = await _datasource.getPokemonByIndex(index);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, FirstGenerationEntity>>
      getFirstGenerationPokemons() async {
    try {
      final result = await _datasource.getFirstGenerationPokemons();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
