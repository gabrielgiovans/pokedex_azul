import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:pokedex_azul/features/presenter/widgets/pokemon_card.dart';

import '../../domain/entities/first_generation_entity.dart';
import '../controllers/captured_pokemons_controller.dart';
import '../controllers/home_controller.dart';

class CapturablePokemonList extends StatelessWidget {
  CapturablePokemonList({
    super.key,
    required this.pokeImgUrl,
  });

  final firstGenerationController = Modular.get<FirstGenerationController>();
  final capturedPokemonsController = Modular.get<CapturedPokemonsController>();
  final String pokeImgUrl;

  @override
  Widget build(BuildContext context) {
    firstGenerationController.getFirstGenerationPokemons();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ScopedBuilder(
        store: firstGenerationController,
        onState: (context, FirstGenerationEntity state) => GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemCount: state.pokemons.length,
          itemBuilder: (_, index) {
            var pokemon = state.pokemons[index];
            return PokemonCard(
              id: index + 1,
              imageUrl: pokeImgUrl,
              name: pokemon.name,
            );
          },
        ),
      ),
    );
  }
}
