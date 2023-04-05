import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokedex_azul/app_module.dart';
import 'package:pokedex_azul/app_widget.dart';
import 'package:pokedex_azul/features/domain/entities/captured_pokemons_entity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Prepare the hive box for simulate the captured pokemons API
  await Hive.initFlutter();
  Hive.registerAdapter<CapturedPokemonsEntity>(CapturedPokemonsEntityAdapter());
  Hive.registerAdapter<CapturedPokemonEntity>(CapturedPokemonEntityAdapter());

  runApp(
    MediaQuery(
      data: const MediaQueryData(),
      child: ModularApp(
        module: AppModule(),
        child: const AppWidget(),
      ),
    ),
  );
}
