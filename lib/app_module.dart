import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex_azul/core/dio_client/dio_client_implementation.dart';
import 'package:pokedex_azul/features/data/data_sources/authentication_datasource_implementation.dart';
import 'package:pokedex_azul/features/data/data_sources/pokemon_datasource_implementation.dart';
import 'package:pokedex_azul/features/data/repositories/authentication_repository_implementation.dart';
import 'package:pokedex_azul/features/data/repositories/captured_pokemons_repository_implementatio.dart';
import 'package:pokedex_azul/features/data/repositories/pokemon_repository_implementation.dart';
import 'package:pokedex_azul/features/domain/usecases/authentication_usecase.dart';
import 'package:pokedex_azul/features/domain/usecases/capture_pokemon_usecase.dart';
import 'package:pokedex_azul/features/domain/usecases/get_captured_pokemons_usecase.dart';
import 'package:pokedex_azul/features/domain/usecases/get_first_generation_pokemons_usecase.dart';
import 'package:pokedex_azul/features/domain/usecases/get_pokemon_from_index_usecase.dart';
import 'package:pokedex_azul/features/domain/usecases/release_pokemon_usecase.dart';
import 'package:pokedex_azul/features/domain/usecases/sign_out_usecase.dart';
import 'package:pokedex_azul/features/presenter/controllers/home_controller.dart';
import 'package:pokedex_azul/features/presenter/controllers/pokemon_controller.dart';
import 'package:pokedex_azul/features/presenter/pages/login_page.dart';
import 'package:pokedex_azul/features/presenter/pages/pokemon_details.dart';

import 'features/data/data_sources/captured_pokemons_datasource_implementation.dart';
import 'features/presenter/controllers/authentication_controller.dart';
import 'features/presenter/controllers/captured_pokemons_controller.dart';
import 'features/presenter/pages/home_page.dart';
import 'features/presenter/pages/profile_page.dart';
import 'features/presenter/pages/settings_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => FirstGenerationController(i())),
        Bind((i) => GetFirstGenerationPokemonsUsecase(i())),
        Bind((i) => PokemonRepositoryImplementation(i())),
        Bind((i) => PokemonDatasourceImplementation(client: i())),
        Bind((i) => DioClientImplementation()),
        Bind((i) => CapturePokemonUsecase(i())),
        Bind((i) => ReleasePokemonUsecase(i())),
        Bind((i) => GetCapturedPokemonsUsecase(i())),
        Bind((i) => CapturedPokemonsRepositoryImplementation(i())),
        Bind((i) => CapturedPokemonsDatasourceImplementation()),
        Bind((i) => CapturedPokemonsController(i(), i(), i())),
        Bind((i) => GetPokemonFromIndexUsecase(i())),
        Bind((i) => PokemonController(i())),
        Bind((i) => AuthenticationController(i(), i())),
        Bind((i) => AuthenticationUsecase(i())),
        Bind((i) => AuthenticationRepositoryImplementation(i())),
        Bind((i) => AuthenticationDatasourceImplementation()),
        Bind((i) => SignOutUsecase(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (context, args) => LoginPage()),
        ChildRoute('/home', child: (context, args) => const HomePage()),
        ChildRoute('/profile', child: (context, args) => const ProfilePage()),
        ChildRoute('/settings', child: (context, args) => const SettingsPage()),
        ChildRoute(
          '/podemonDetails/:pokemonId',
          child: (context, args) => PokemonDetailsPage(
            pokemonId: int.parse(args.params['pokemonId']),
          ),
        ),
      ];
}
