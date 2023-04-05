import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_azul/core/errors/failures.dart';
import 'package:pokedex_azul/core/usecase/usecase.dart';
import 'package:pokedex_azul/features/domain/repositories/authentication_repository.dart';
import 'package:pokedex_azul/features/domain/usecases/sign_out_usecase.dart';

class MockAuthenticationRepository extends Mock
    implements IAuthenticationRepository {}

void main() {
  late IAuthenticationRepository repository;
  late SignOutUsecase usecase;

  setUp(() {
    repository = MockAuthenticationRepository();
    usecase = SignOutUsecase(repository);
  });

  test('should logout the user', () async {
    // Arrange
    when(() => repository.signOut()).thenAnswer(
      (_) async => const Right(true),
    );

    // Act
    final result = await usecase(NoParams());

    //Assert
    expect(result, const Right(true));
    verify(() => repository.signOut()).called(1);
    verifyNoMoreInteractions(repository);
  });

  test('should throw an Exception when user dont get suceed', () async {
    // Arrange
    when(() => repository.signOut()).thenThrow(AuthenticationFailure());

    // Act
    final result = usecase(NoParams());

    // Assert
    expect(result, throwsA(isA<AuthenticationFailure>()));

    verify(() => repository.signOut()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
