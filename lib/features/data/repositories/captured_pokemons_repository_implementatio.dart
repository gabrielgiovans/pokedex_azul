import 'package:pokedex_azul/features/domain/entities/captured_pokemons_entity.dart';
import 'package:pokedex_azul/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../core/errors/exceptions.dart';
import '../../../core/usecase/usecase.dart';
import '../../domain/repositories/captured_pokemons_repository.dart';
import '../data_sources/captured_pokemons_datasource.dart';

class CapturedPokemonsRepositoryImplementation
    implements ICapturedPokemonsRepository {
  final ICapturedPokemonsDatasource _datasource;

  CapturedPokemonsRepositoryImplementation(this._datasource);

  @override
  Future<Either<Failure, void>> capturePokemon(
      CapturePokemonParams params) async {
    try {
      final result = await _datasource.capturePokemon(params.id, params.name);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, CapturedPokemonsEntity>> getCapturedPokemons() async {
    try {
      final result = await _datasource.getCapturedPokemons();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> releasePokemon(int idPokemon) async {
    try {
      final result = await _datasource.releasePokemon(idPokemon);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
