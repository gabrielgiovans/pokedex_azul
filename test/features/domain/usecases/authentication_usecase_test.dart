import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_azul/core/errors/failures.dart';
import 'package:pokedex_azul/core/usecase/usecase.dart';
import 'package:pokedex_azul/features/data/models/user_model.dart';
import 'package:pokedex_azul/features/domain/entities/user_entity.dart';
import 'package:pokedex_azul/features/domain/repositories/authentication_repository.dart';
import 'package:pokedex_azul/features/domain/usecases/authentication_usecase.dart';

class MockAuthenticationRepository extends Mock
    implements IAuthenticationRepository {}

void main() {
  late IAuthenticationRepository repository;
  late AuthenticationUsecase usecase;

  setUp(() {
    repository = MockAuthenticationRepository();
    usecase = AuthenticationUsecase(repository);
  });

  group('AuthenticationUseCase', () {
    const tUser = UserModel(
      id: '2',
      displayName: 'Gabriel',
      email: 'gabrielgiovans@gmail.com',
      photoUrl: 'test.com.br/image.png',
    );

    test('should return a User entity when user is authenticated', () async {
      // Arrange
      when(() => repository.signInWithGoogleAndGetUser()).thenAnswer(
        (_) async => const Right<Failure, UserEntity?>(tUser),
      );

      // Act
      final result = await usecase(NoParams());

      // Assert
      // expect(result, isA<UserEntity>());
      expect(result, const Right(tUser));

      verify(() => repository.signInWithGoogleAndGetUser()).called(1);
      verifyNoMoreInteractions(repository);
    });

    test('should throw an Exception when user is not authenticated', () async {
      // Arrange
      when(() => repository.signInWithGoogleAndGetUser())
          .thenThrow(AuthenticationFailure());

      // Act
      final result = usecase(NoParams());

      // Assert
      expect(result, throwsA(isA<AuthenticationFailure>()));

      verify(() => repository.signInWithGoogleAndGetUser()).called(1);
      verifyNoMoreInteractions(repository);
    });
  });
}
