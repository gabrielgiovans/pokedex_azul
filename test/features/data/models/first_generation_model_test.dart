import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_azul/features/data/models/first_generation_model.dart';
import 'package:pokedex_azul/features/domain/entities/first_generation_entity.dart';

import '../../mocks/first_generation_entity_mock.dart';
import '../../mocks/first_generation_mock.dart';

void main() {
  test(
    'Should be a subclass of FirstGenerationEntity',
    () {
      expect(tFirstGeneration, isA<FirstGenerationEntity>());
    },
  );

  test('Should return a valid FirstGenerationModel', () {
    //act
    final firstGeneration = FirstGenerationModel.fromJson(firstGenerationMock);

    //Assert
    expect(firstGeneration, tFirstGeneration);
  });
}
