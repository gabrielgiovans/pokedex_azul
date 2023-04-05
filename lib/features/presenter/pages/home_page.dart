import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../controllers/authentication_controller.dart';
import '../widgets/capturable_pokemon_list.dart';
import '../widgets/captured_pokemon_list.dart';
import '../widgets/poke_bar.dart';
import '../widgets/poke_drawer.dart';
import '../widgets/poke_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  final pokeImgUrl =
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/';
  final authenticationController = Modular.get<AuthenticationController>();
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _tabController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PokeBar(label: 'Pokedex Azul'),
      drawer: const PokeDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: [
          CapturablePokemonList(
            pokeImgUrl: pokeImgUrl,
          ),
          CapturedPokemonList(
            pokeImgUrl: pokeImgUrl,
          ),
        ],
      ),
      bottomNavigationBar: PokeNavBar(tabController: _tabController),
    );
  }
}
