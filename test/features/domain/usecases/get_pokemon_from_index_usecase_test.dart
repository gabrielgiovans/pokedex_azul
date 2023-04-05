import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_azul/core/errors/failures.dart';
import 'package:pokedex_azul/features/data/models/pokemon_model.dart';
import 'package:pokedex_azul/features/domain/entities/pokemon_entity.dart';
import 'package:pokedex_azul/features/domain/repositories/pokemon_repository.dart';
import 'package:pokedex_azul/features/domain/usecases/get_pokemon_from_index_usecase.dart';

class MockPokemonRepository extends Mock implements IPokemonRepository {}

void main() {
  late GetPokemonFromIndexUsecase usecase;
  late IPokemonRepository repository;

  setUp(() {
    repository = MockPokemonRepository();
    usecase = GetPokemonFromIndexUsecase(repository);
  });

  final tPokemon = PokemonModel.fromJson(const {
    "abilities": [
      {
        "ability": {
          "name": "overgrow",
          "url": "https://pokeapi.co/api/v2/ability/65/"
        },
        "is_hidden": false,
        "slot": 1
      },
      {
        "ability": {
          "name": "chlorophyll",
          "url": "https://pokeapi.co/api/v2/ability/34/"
        },
        "is_hidden": true,
        "slot": 3
      }
    ],
    "height": 7,
    "id": 1,
    "location_area_encounters":
        "https://pokeapi.co/api/v2/pokemon/1/encounters",
    "name": "bulbasaur",
    "order": 1,
    "sprites": {
      "other": {
        "dream_world": {
          "front_default":
              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/1.svg",
          "front_female": null
        }
      }
    },
    "stats": [
      {
        "base_stat": 45,
        "effort": 0,
        "stat": {"name": "hp", "url": "https://pokeapi.co/api/v2/stat/1/"}
      },
      {
        "base_stat": 49,
        "effort": 0,
        "stat": {"name": "attack", "url": "https://pokeapi.co/api/v2/stat/2/"}
      },
      {
        "base_stat": 49,
        "effort": 0,
        "stat": {"name": "defense", "url": "https://pokeapi.co/api/v2/stat/3/"}
      },
      {
        "base_stat": 65,
        "effort": 1,
        "stat": {
          "name": "special-attack",
          "url": "https://pokeapi.co/api/v2/stat/4/"
        }
      },
      {
        "base_stat": 65,
        "effort": 0,
        "stat": {
          "name": "special-defense",
          "url": "https://pokeapi.co/api/v2/stat/5/"
        }
      },
      {
        "base_stat": 45,
        "effort": 0,
        "stat": {"name": "speed", "url": "https://pokeapi.co/api/v2/stat/6/"}
      }
    ],
    "types": [
      {
        "slot": 1,
        "type": {"name": "grass", "url": "https://pokeapi.co/api/v2/type/12/"}
      },
      {
        "slot": 2,
        "type": {"name": "poison", "url": "https://pokeapi.co/api/v2/type/4/"}
      }
    ],
    "weight": 69
  });
  const tIndex = 1;
  test(
    'should get pokemon by index from the repository',
    () async {
      //Arrange
      when(() => repository.getPokemonByIndex(tIndex))
          .thenAnswer((_) async => Right<Failure, PokemonEntity>(tPokemon));

      //Act
      final result = await usecase(tIndex);

      //Assert
      expect(result, Right(tPokemon));
      verify(() => repository.getPokemonByIndex(tIndex)).called(1);
    },
  );

  test(
    'should return a ServerFailure when get pokemon by index from the repository dont succeed',
    () async {
      //Arrange
      when(() => repository.getPokemonByIndex(tIndex)).thenAnswer(
          (_) async => Left<Failure, PokemonEntity>(ServerFailure()));

      //Act
      final result = await usecase(tIndex);

      //Assert
      expect(result, Left(ServerFailure()));
      verify(() => repository.getPokemonByIndex(tIndex)).called(1);
    },
  );
}
