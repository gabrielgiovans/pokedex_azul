import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_azul/core/errors/failures.dart';
import 'package:pokedex_azul/core/usecase/usecase.dart';
import 'package:pokedex_azul/features/domain/usecases/get_first_generation_pokemons_usecase.dart';
import 'package:pokedex_azul/features/presenter/controllers/home_controller.dart';

import '../../mocks/first_generation_entity_mock.dart';

class MockGetFirstGenerationPokemonsUsecase extends Mock
    implements GetFirstGenerationPokemonsUsecase {}

void main() {
  late FirstGenerationController controller;
  late GetFirstGenerationPokemonsUsecase mockUsecase;

  setUp(() {
    mockUsecase = MockGetFirstGenerationPokemonsUsecase();
    controller = FirstGenerationController(mockUsecase);
    registerFallbackValue(NoParams());
  });

  test('should return a FirstGeneration from the usecase', () async {
    //Arrange
    when(() => mockUsecase(any()))
        .thenAnswer((_) async => Right(tFirstGeneration));

    //Act
    controller.getFirstGenerationPokemons();

    //Assert
    controller.observer(onState: (state) {
      expect(state, tFirstGeneration);
      verify(() => mockUsecase(NoParams())).called(1);
    });
  });

  final tFailure = ServerFailure();

  test('should return a failure from the usecase when there is an error',
      () async {
    //Arrange
    when(() => mockUsecase(any())).thenAnswer((_) async => Left(tFailure));

    //Act
    controller.getFirstGenerationPokemons();

    //Assert
    controller.observer(onError: (error) {
      expect(error, tFailure);
      verify(() => mockUsecase(NoParams())).called(1);
    });
  });
}
