import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_azul/core/dio_client/dio_client.dart';
import 'package:pokedex_azul/core/errors/exceptions.dart';
import 'package:pokedex_azul/features/data/data_sources/pokemon_datasource.dart';
import 'package:pokedex_azul/features/data/data_sources/pokemon_datasource_implementation.dart';
import 'package:pokedex_azul/features/data/models/first_generation_model.dart';
import 'package:pokedex_azul/features/data/models/pokemon_model.dart';

import '../../mocks/first_generation_mock.dart';
import '../../mocks/pokemon_mock.dart';

class DioClientMock extends Mock implements IDioClient {}

void main() {
  late IPokemonDatasource datasource;
  late IDioClient client;
  setUp(() {
    client = DioClientMock();
    datasource = PokemonDatasourceImplementation(client: client);
  });
  const tIndex = 1;
  const tNegativeIndex = -99;
  const pokemonUrl = 'https://pokeapi.co/api/v2/pokemon/$tIndex/';
  const firstGenerationUrl =
      'https://pokeapi.co/api/v2/pokemon?limit=151&offset=0';

  void successPokemonMock() => when(() => client.get(any())).thenAnswer(
        (_) async => DioResponse(
          data: pokemonMock,
          statusCode: 200,
        ),
      );
  void successFirstGenerationMock() => when(() => client.get(any())).thenAnswer(
        (_) async => DioResponse(
          data: firstGenerationMock,
          statusCode: 200,
        ),
      );
  test('Should call the get method with correct pokemonUrl', () async {
    //Arrange
    successPokemonMock();
    //Act
    await datasource.getPokemonByIndex(tIndex);
    //Assert
    verify(() => client.get(pokemonUrl)).called(1);
  });

  test('Should return the PokemonModel when succeed', () async {
    //Arrange
    successPokemonMock();
    final tPokemonModelExpected = PokemonModel.fromJson(
      pokemonMock,
    );
    //Act
    final result = await datasource.getPokemonByIndex(tIndex);
    //Assert
    expect(tPokemonModelExpected, result);
  });

  test(
      'Should return a ServerException when server has problems in getPokemonByIndex',
      () {
    //Arrange
    serverError(client);
    //Act
    final result = datasource.getPokemonByIndex(tIndex);

    //Assert
    expect(() => result, throwsA(ServerException()));
  });

  test('Should return a ServerException when index < 1', () {
    //Arrange
    successPokemonMock();
    //Act
    final result = datasource.getPokemonByIndex(tNegativeIndex);

    //Assert
    expect(() => result, throwsA(ServerException()));
  });

  test('Should call the get method with correct firstGenerationUrl', () async {
    //Arrange
    successFirstGenerationMock();
    //Act
    await datasource.getFirstGenerationPokemons();
    //Assert
    verify(() => client.get(firstGenerationUrl)).called(1);
  });

  test('Should return the FirstGenerationModel when succeed', () async {
    //Arrange
    successFirstGenerationMock();
    final tFirstGenerationModelExpected = FirstGenerationModel.fromJson(
      firstGenerationMock,
    );
    //Act
    final result = await datasource.getFirstGenerationPokemons();
    //Assert
    expect(tFirstGenerationModelExpected, result);
  });

  test(
      'Should return a ServerException when server has problems in getFirtGenerationPokemons',
      () {
    //Arrange
    serverError(client);
    //Act
    final result = datasource.getFirstGenerationPokemons();

    //Assert
    expect(() => result, throwsA(ServerException()));
  });
}

void serverError(IDioClient client) {
  when(() => client.get(any())).thenAnswer(
    (_) async => DioResponse(
      data: 'server error',
      statusCode: 400,
    ),
  );
}
