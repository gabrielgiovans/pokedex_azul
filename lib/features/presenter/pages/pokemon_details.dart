import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:pokedex_azul/core/extensions/string_first_letter_capitalize.dart';
import '../../domain/entities/pokemon_entity.dart';
import '../controllers/captured_pokemons_controller.dart';
import '../controllers/pokemon_controller.dart';
import '../widgets/poke_bar.dart';
import '../widgets/progress_bar.dart';

class PokemonDetailsPage extends StatefulWidget {
  final int pokemonId;
  const PokemonDetailsPage({super.key, required this.pokemonId});

  @override
  State<PokemonDetailsPage> createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  final _pokemonController = Modular.get<PokemonController>();
  final _pokeImgUrl =
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/';
  final List<Color> statsColors = <Color>[
    const Color(0xFFD43A45),
    const Color(0xFFF18E1E),
    const Color(0xFF1D79C3),
    const Color(0xFF0E866A),
    const Color(0xFF821BC1),
  ];
  final _capturedPokemonsController = Modular.get<CapturedPokemonsController>();

  @override
  void initState() {
    if (_pokemonController.state.id != widget.pokemonId) {
      _pokemonController.getPokemonFromIndex(widget.pokemonId);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PokeBar(label: 'Profile', elevation: 0),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: ScopedBuilder(
              store: _pokemonController,
              onError: (context, error) => const Center(
                child: Text('Server Error'),
              ),
              onLoading: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
              onState: (context, PokemonEntity pokemon) =>
                  _buildPokemonDetails(pokemon, context),
            ),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView _buildPokemonDetails(
      PokemonEntity pokemon, BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildPokemonImage(pokemon),
          _buildPokemonName(pokemon),
          _buildCaptureAndReleaseButton(pokemon, context),
          _buildPokemonStats(pokemon),
        ],
      ),
    );
  }

  Text _buildPokemonName(PokemonEntity pokemon) {
    return Text(
      pokemon.name.capitalize(),
      style: const TextStyle(fontSize: 40),
    );
  }

  Center _buildPokemonStats(PokemonEntity pokemon) {
    return Center(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Base stats',
              style: TextStyle(fontSize: 22),
            ),
          ),
          for (int i = 0; i < pokemon.stats.length - 1; i++)
            GradientProgressBar(
              value: pokemon.stats[i].baseStat.toDouble(),
              label: pokemon.stats[i].stat.name.toUpperCase(),
              color: statsColors[i],
              backgroundColor: Colors.grey,
            ),
        ],
      ),
    );
  }

  Row _buildCaptureAndReleaseButton(
      PokemonEntity pokemon, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {
            _capturedPokemonsController.capturePokemon(
              pokemon.id,
              pokemon.name,
              context,
            );
          },
          child: Image.asset('assets/icons/pokeball.png'),
        ),
        InkWell(
          onTap: () async {
            await _capturedPokemonsController.releasePokemon(
              pokemon.id,
            );
          },
          child: Image.asset('assets/icons/open-pokeball.png'),
        ),
      ],
    );
  }

  CachedNetworkImage _buildPokemonImage(PokemonEntity pokemon) {
    return CachedNetworkImage(
      imageUrl: '$_pokeImgUrl${pokemon.id}.png',
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      imageBuilder: (context, imageProvider) => Container(
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(100)),
          color: Colors.blue,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
