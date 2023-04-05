import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_azul/core/errors/failures.dart';
import 'package:pokedex_azul/core/usecase/usecase.dart';
import 'package:pokedex_azul/features/domain/entities/first_generation_entity.dart';
import 'package:pokedex_azul/features/domain/repositories/pokemon_repository.dart';
import 'package:pokedex_azul/features/domain/usecases/get_first_generation_pokemons_usecase.dart';

import '../../mocks/first_generation_entity_mock.dart';

class MockPokemonRepository extends Mock implements IPokemonRepository {}

void main() {
  late GetFirstGenerationPokemonsUsecase usecase;
  late IPokemonRepository repository;

  setUp(() {
    repository = MockPokemonRepository();
    usecase = GetFirstGenerationPokemonsUsecase(repository);
  });

  test('Should get first generation pokemons from the repository', () async {
    //Arrange
    when(() => repository.getFirstGenerationPokemons()).thenAnswer(
        (_) async => Right<Failure, FirstGenerationEntity>(tFirstGeneration));
    //Act
    final result = await usecase(NoParams());

    //Assert
    expect(result, Right(tFirstGeneration));
    verify(() => repository.getFirstGenerationPokemons()).called(1);
  });

  test(
    'should return a ServerFailure when get first generation pokemons from the repository dont succeed',
    () async {
      //Arrange
      when(() => repository.getFirstGenerationPokemons()).thenAnswer(
          (_) async => Left<Failure, FirstGenerationEntity>(ServerFailure()));

      //Act
      final result = await usecase(NoParams());

      //Assert
      expect(result, Left(ServerFailure()));
      verify(() => repository.getFirstGenerationPokemons()).called(1);
    },
  );
}
