import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_azul/core/errors/failures.dart';
import 'package:pokedex_azul/core/usecase/usecase.dart';
import 'package:pokedex_azul/features/data/models/pokemon_model.dart';
import 'package:pokedex_azul/features/domain/usecases/get_pokemon_from_index_usecase.dart';
import 'package:pokedex_azul/features/presenter/controllers/pokemon_controller.dart';

import '../../mocks/first_generation_entity_mock.dart';
import '../../mocks/pokemon_mock.dart';

class MockGetPokemonFromIndexUsecase extends Mock
    implements GetPokemonFromIndexUsecase {}

void main() {
  late PokemonController controller;
  late GetPokemonFromIndexUsecase mockUsecase;

  setUp(() {
    mockUsecase = MockGetPokemonFromIndexUsecase();
    controller = PokemonController(mockUsecase);
    registerFallbackValue(NoParams());
  });

  test('should return a Pokemon from the usecase', () async {
    //Arrange
    when(() => mockUsecase(any()))
        .thenAnswer((_) async => Right(PokemonModel.fromJson(pokemonMock)));

    //Act
    controller.getPokemonFromIndex(1);

    //Assert
    controller.observer(onState: (state) {
      expect(state, PokemonModel.fromJson(pokemonMock));
      verify(() => mockUsecase(any())).called(1);
    });
  });

  test(
      'should return a failure from the usecase when there is an error in getPokemonByIndex',
      () async {
    //Arrange
    when(() => mockUsecase(any()))
        .thenAnswer((_) async => Left(ServerFailure()));

    //Act
    controller.getPokemonFromIndex(1);

    //Assert
    controller.observer(onError: (error) {
      expect(error, ServerFailure());
      verify(() => mockUsecase(any())).called(1);
    });
  });
}
