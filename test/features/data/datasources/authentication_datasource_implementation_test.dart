import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_azul/features/data/data_sources/authentication_datasource.dart';
import 'package:pokedex_azul/features/data/data_sources/authentication_datasource_implementation.dart';

class MockAuthenticationDatasource extends Mock
    implements AuthenticationDatasourceImplementation {}

void main() {
  late IAuthenticationDatasource datasource;

  setUp(() {
    datasource = MockAuthenticationDatasource();
  });

  test('Should call signInWithGoogle once', () async {
    //Arrange
    when(() => datasource.signInWithGoogle()).thenAnswer((_) async => null);

    //Act
    await datasource.signInWithGoogle();

    //Assert
    verify(() => datasource.signInWithGoogle()).called(1);
  });
  test('Should call signOut once', () async {
    //Arrange
    when(() => datasource.signOut()).thenAnswer((_) async => true);

    //Act
    await datasource.signOut();

    //Assert
    verify(() => datasource.signOut()).called(1);
  });
}
