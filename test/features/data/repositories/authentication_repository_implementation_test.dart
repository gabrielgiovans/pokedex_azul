import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_azul/features/data/data_sources/authentication_datasource.dart';
import 'package:pokedex_azul/features/data/repositories/authentication_repository_implementation.dart';

import '../../mocks/user_mock.dart';

class MockAuthenticationDatasource extends Mock
    implements IAuthenticationDatasource {}

void main() {
  late AuthenticationRepositoryImplementation repository;
  late IAuthenticationDatasource datasource;

  setUp(() {
    datasource = MockAuthenticationDatasource();
    repository = AuthenticationRepositoryImplementation(datasource);
  });

  test(
    'should return UserModel when calls the datasource',
    () async {
      //Arrange
      when(() => datasource.signInWithGoogle()).thenAnswer((_) async => tUser);
      //Act
      final result = await repository.signInWithGoogleAndGetUser();
      //Assert
      expect(result, const Right(tUser));
      verify(() => datasource.signInWithGoogle()).called(1);
    },
  );

  test(
    'should logout the user',
    () async {
      //Arrange
      when(() => datasource.signOut()).thenAnswer((_) async => true);
      //Act
      final result = await repository.signOut();
      //Assert
      expect(result, const Right(true));
      verify(() => datasource.signOut()).called(1);
    },
  );
}
