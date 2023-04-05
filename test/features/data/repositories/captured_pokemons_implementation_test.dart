import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_azul/core/errors/exceptions.dart';
import 'package:pokedex_azul/core/errors/failures.dart';
import 'package:pokedex_azul/features/data/data_sources/captured_pokemons_datasource.dart';
import 'package:pokedex_azul/features/data/repositories/captured_pokemons_repository_implementatio.dart';

import '../../mocks/captured_pokemon_mock.dart';
import '../../mocks/captured_pokemons_list_mock.dart';

class MockPokemonDatasource extends Mock
    implements ICapturedPokemonsDatasource {}

void main() {
  late CapturedPokemonsRepositoryImplementation repository;
  late ICapturedPokemonsDatasource datasource;

  setUp(() {
    datasource = MockPokemonDatasource();
    repository = CapturedPokemonsRepositoryImplementation(datasource);
  });

  test(
    'should return Captured Pokemons when calls the datasource',
    () async {
      //Arrange
      when(() => datasource.getCapturedPokemons())
          .thenAnswer((_) async => tCapturedPokemonsList);
      //Act
      final result = await repository.getCapturedPokemons();
      //Assert
      expect(result, const Right(tCapturedPokemonsList));
      verify(() => datasource.getCapturedPokemons()).called(1);
    },
  );

  test(
      'should return a server failure when the call to datasource is unsucessful',
      () async {
    //Arrange
    when(() => datasource.getCapturedPokemons()).thenThrow(ServerException());
    //Act
    final result = await repository.getCapturedPokemons();
    //Assert
    expect(result, Left(ServerFailure()));
    verify(() => datasource.getCapturedPokemons()).called(1);
  });

  test(
    'should capture the pokemon when calls the datasource',
    () async {
      //Arrange
      when(() => datasource.capturePokemon(
              tCapturePokemonParams.id, tCapturePokemonParams.name))
          .thenAnswer((_) async => Null);
      //Act
      final result = await repository.capturePokemon(tCapturePokemonParams);
      //Assert
      expect(result, const Right(Null));
      verify(() => datasource.capturePokemon(
            tCapturePokemonParams.id,
            tCapturePokemonParams.name,
          )).called(1);
    },
  );

  test(
      'should return a server failure when the call to datasource is unsucessful in CapturePokemon',
      () async {
    //Arrange
    when(() => datasource.capturePokemon(
            tCapturePokemonParams.id, tCapturePokemonParams.name))
        .thenThrow(ServerException());
    //Act
    final result = await repository.capturePokemon(tCapturePokemonParams);
    //Assert
    expect(result, Left(ServerFailure()));
    verify(() => datasource.capturePokemon(
        tCapturePokemonParams.id, tCapturePokemonParams.name)).called(1);
  });

  test(
    'should release the pokemon when calls the datasource',
    () async {
      //Arrange
      when(() => datasource.releasePokemon(tCapturePokemonParams.id))
          .thenAnswer((_) async => true);
      //Act
      final result = await repository.releasePokemon(tCapturePokemonParams.id);
      //Assert
      expect(result, const Right(Null));
      verify(() => datasource.releasePokemon(tCapturePokemonParams.id))
          .called(1);
    },
  );

  test(
      'should return a server failure when the call to datasource is unsucessful in Release Pokemon',
      () async {
    //Arrange
    when(() => datasource.releasePokemon(tCapturePokemonParams.id))
        .thenThrow(ServerException());
    //Act
    final result = await repository.releasePokemon(tCapturePokemonParams.id);
    //Assert
    expect(result, Left(ServerFailure()));
    verify(() => datasource.releasePokemon(tCapturePokemonParams.id)).called(1);
  });
}
