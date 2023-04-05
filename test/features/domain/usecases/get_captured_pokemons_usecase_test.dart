import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_azul/core/errors/failures.dart';
import 'package:pokedex_azul/core/usecase/usecase.dart';
import 'package:pokedex_azul/features/domain/entities/captured_pokemons_entity.dart';
import 'package:pokedex_azul/features/domain/repositories/captured_pokemons_repository.dart';
import 'package:pokedex_azul/features/domain/usecases/get_captured_pokemons_usecase.dart';

import '../../mocks/captured_pokemons_list_mock.dart';

class CapturedPokemonsRepositoryMock extends Mock
    implements ICapturedPokemonsRepository {}

void main() {
  late ICapturedPokemonsRepository repository;
  late GetCapturedPokemonsUsecase usecase;

  setUp(
    () => {
      repository = CapturedPokemonsRepositoryMock(),
      usecase = GetCapturedPokemonsUsecase(repository),
    },
  );
  test('Should return a list of captured pokemons', () async {
    //Arrange
    when(() => repository.getCapturedPokemons()).thenAnswer(
      (_) async =>
          const Right<Failure, CapturedPokemonsEntity>(tCapturedPokemonsList),
    );
    //Act
    final result = await usecase(NoParams());

    //Assert
    expect(result, const Right(tCapturedPokemonsList));
    verify(() => repository.getCapturedPokemons()).called(1);
  });

  test(
      'Should return a ServerFailure when try to obtain the captured pokemons list from the repository',
      () async {
    //Arrange
    when(() => repository.getCapturedPokemons()).thenAnswer(
      (_) async => Left<Failure, CapturedPokemonsEntity>(ServerFailure()),
    );
    //Act
    final result = await usecase(NoParams());

    //Assert
    expect(result, Left(ServerFailure()));
    verify(() => repository.getCapturedPokemons()).called(1);
  });
}
