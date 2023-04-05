import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_azul/core/errors/failures.dart';
import 'package:pokedex_azul/core/usecase/usecase.dart';
import 'package:pokedex_azul/features/domain/usecases/authentication_usecase.dart';
import 'package:pokedex_azul/features/domain/usecases/sign_out_usecase.dart';
import 'package:pokedex_azul/features/presenter/controllers/authentication_controller.dart';

import '../../mocks/first_generation_entity_mock.dart';
import '../../mocks/user_mock.dart';

class MockAuthenticationUsecase extends Mock implements AuthenticationUsecase {}

class MockSignOutUsecase extends Mock implements SignOutUsecase {}

void main() {
  late AuthenticationController controller;
  late MockAuthenticationUsecase mockAuthenticationUsecase;
  late MockSignOutUsecase mockSignOutUsecase;

  setUp(() {
    mockSignOutUsecase = MockSignOutUsecase();
    mockAuthenticationUsecase = MockAuthenticationUsecase();
    controller =
        AuthenticationController(mockSignOutUsecase, mockAuthenticationUsecase);
    registerFallbackValue(NoParams());
  });

  final tFailure = ServerFailure();

  test(
      'should return a failure from the usecase when there is an error in signInWithGoogleAndGetUser',
      () async {
    //Arrange
    when(() => mockAuthenticationUsecase(any()))
        .thenAnswer((_) async => Left(tFailure));

    //Act
    controller.signInWithGoogleAndGetUser();

    //Assert
    controller.observer(onError: (error) {
      expect(error, tFailure);
      verify(() => mockAuthenticationUsecase(NoParams())).called(1);
    });
  });

  test(
      'should return a failure from the usecase when there is an error in signOut',
      () async {
    //Arrange
    when(() => mockSignOutUsecase(any()))
        .thenAnswer((_) async => Left(tFailure));

    //Act
    controller.signOut();

    //Assert
    controller.observer(onError: (error) {
      expect(error, tFailure);
      verify(() => mockSignOutUsecase(NoParams())).called(1);
    });
  });
}
