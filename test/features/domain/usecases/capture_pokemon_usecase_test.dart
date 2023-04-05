import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_azul/core/errors/failures.dart';
import 'package:pokedex_azul/features/domain/repositories/captured_pokemons_repository.dart';
import 'package:pokedex_azul/features/domain/usecases/capture_pokemon_usecase.dart';

import '../../mocks/captured_pokemon_mock.dart';

class MockCapturedPokemonRepository extends Mock
    implements ICapturedPokemonsRepository {}

void main() {
  late CapturePokemonUsecase usecase;
  late ICapturedPokemonsRepository repository;

  setUp(() {
    repository = MockCapturedPokemonRepository();
    usecase = CapturePokemonUsecase(repository);
  });

  test('should capture pokemon', () async {
    // arrange
    when(() => repository.capturePokemon(tCapturePokemonParams))
        .thenAnswer((_) async => const Right(null));

    // act
    final result = await usecase(tCapturePokemonParams);

    // assert
    expect(result, const Right(null));
    verify(() => repository.capturePokemon(tCapturePokemonParams)).called(1);
    verifyNoMoreInteractions(repository);
  });

  test('should return a failure when capturing the pokemon fails', () async {
    //Arrange
    when(() => repository.capturePokemon(tCapturePokemonParams))
        .thenAnswer((_) async => Left<Failure, void>(ServerFailure()));

    //Act
    final result = await usecase(tCapturePokemonParams);

    //Assert
    expect(result, Left(ServerFailure()));
    verify(() => repository.capturePokemon(tCapturePokemonParams)).called(1);
    verifyNoMoreInteractions(repository);
  });
}
