import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_azul/core/errors/exceptions.dart';
import 'package:pokedex_azul/core/errors/failures.dart';
import 'package:pokedex_azul/features/data/data_sources/pokemon_datasource.dart';
import 'package:pokedex_azul/features/data/models/pokemon_model.dart';
import 'package:pokedex_azul/features/data/repositories/pokemon_repository_implementation.dart';

import '../../mocks/pokemon_mock.dart';

class MockPokemonDatasource extends Mock implements IPokemonDatasource {}

void main() {
  late PokemonRepositoryImplementation repository;
  late IPokemonDatasource datasource;

  setUp(() {
    datasource = MockPokemonDatasource();
    repository = PokemonRepositoryImplementation(datasource);
  });

  final tPokemon = PokemonModel.fromJson(pokemonMock);
  const tIndex = 1;
  test(
    'should return Pokemon model when calls the datasource',
    () async {
      //Arrange
      when(() => datasource.getPokemonByIndex(tIndex))
          .thenAnswer((_) async => tPokemon);
      //Act
      final result = await repository.getPokemonByIndex(tIndex);
      //Assert
      expect(result, Right(tPokemon));
      verify(() => datasource.getPokemonByIndex(tIndex)).called(1);
    },
  );

  test(
      'should return a server failure when the call to datasource is unsucessful',
      () async {
    //Arrange
    when(() => datasource.getPokemonByIndex(any()))
        .thenThrow(ServerException());
    //Act
    final result = await repository.getPokemonByIndex(tIndex);
    //Assert
    expect(result, Left(ServerFailure()));
    verify(() => datasource.getPokemonByIndex(tIndex)).called(1);
  });
}
