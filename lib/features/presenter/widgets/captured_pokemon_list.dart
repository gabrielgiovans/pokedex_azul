import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:pokedex_azul/features/presenter/widgets/pokemon_card.dart';

import '../../domain/entities/captured_pokemons_entity.dart';
import '../controllers/captured_pokemons_controller.dart';

class CapturedPokemonList extends StatefulWidget {
  const CapturedPokemonList({
    super.key,
    required this.pokeImgUrl,
  });

  final String pokeImgUrl;

  @override
  State<CapturedPokemonList> createState() => _CapturedPokemonListState();
}

class _CapturedPokemonListState extends State<CapturedPokemonList> {
  final _capturedPokemonsController = Modular.get<CapturedPokemonsController>();
  @override
  void didChangeDependencies() {
    _capturedPokemonsController.getCapturedPokemons();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ScopedBuilder(
        store: _capturedPokemonsController,
        onState: (context, CapturedPokemonsEntity state) => GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemCount: state.pokemonslist.length,
          itemBuilder: (_, index) {
            var pokemon = state.pokemonslist[index];
            return PokemonCard(
              id: pokemon.id,
              imageUrl: widget.pokeImgUrl,
              name: pokemon.name,
            );
          },
        ),
      ),
    );
  }
}
