import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_azul/features/data/models/user_model.dart';
import 'package:pokedex_azul/features/domain/entities/user_entity.dart';

import '../../mocks/user_mock.dart';

void main() {
  test(
    'Should be a subclass of UserEntity',
    () {
      //Assert
      expect(tUser, isA<UserEntity>());
    },
  );

  test('Should return a valid PokemonModel', () {
    //Act
    const user = UserModel(
        displayName: 'Teste', email: 'email@email.com', id: '1', photoUrl: '');
    //Assert
    expect(user, tUser);
  });
}
