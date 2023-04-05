import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_azul/core/errors/failures.dart';
import 'package:pokedex_azul/features/domain/repositories/captured_pokemons_repository.dart';
import 'package:pokedex_azul/features/domain/usecases/release_pokemon_usecase.dart';

class MockCapturedPokemonsRepository extends Mock
    implements ICapturedPokemonsRepository {}

void main() {
  late ReleasePokemonUsecase usecase;
  late ICapturedPokemonsRepository repository;

  setUp(() {
    repository = MockCapturedPokemonsRepository();
    usecase = ReleasePokemonUsecase(repository);
  });

  var tPokemonId = 1;

  test('should release a captured pokemon', () async {
    //Arrange
    when(() => repository.releasePokemon(tPokemonId))
        .thenAnswer((_) async => const Right(true));

    //Act
    final result = await usecase(tPokemonId);

    //Assert
    expect(result, const Right(null));
    verify(() => repository.releasePokemon(tPokemonId)).called(1);
    verifyNoMoreInteractions(repository);
  });

  test('should return a failure when releasing the pokemon fails', () async {
    //Arrange
    when(() => repository.releasePokemon(tPokemonId))
        .thenAnswer((_) async => Left(ServerFailure()));

    //Act
    final result = await usecase(tPokemonId);

    //Assert
    expect(result, Left(ServerFailure()));
    verify(() => repository.releasePokemon(tPokemonId)).called(1);
    verifyNoMoreInteractions(repository);
  });
}
