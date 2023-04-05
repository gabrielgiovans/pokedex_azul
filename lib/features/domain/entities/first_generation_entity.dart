import 'package:equatable/equatable.dart';

class FirstGenerationEntity extends Equatable {
  final List<FirstGenerationPokemonEntity> pokemons;

  const FirstGenerationEntity({required this.pokemons});

  @override
  List<Object?> get props => [pokemons];
}

class FirstGenerationPokemonEntity extends Equatable {
  final String name;
  final String url;

  const FirstGenerationPokemonEntity({required this.name, required this.url});

  @override
  List<Object?> get props => [name, url];
}
