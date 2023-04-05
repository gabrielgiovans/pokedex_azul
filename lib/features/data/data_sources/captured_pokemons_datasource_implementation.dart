import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:pokedex_azul/features/domain/entities/captured_pokemons_entity.dart';

import '../../presenter/controllers/authentication_controller.dart';
import 'captured_pokemons_datasource.dart';

class CapturedPokemonsDatasourceImplementation
    implements ICapturedPokemonsDatasource {
  @override
  Future<void> capturePokemon(int id, String name) async {
    Box<CapturedPokemonsEntity> capturedBox = _getBoxFromAuthenticatedUser();

    //searches the list of captured pokemons
    //if it does not exist, it brings an empty list
    CapturedPokemonsEntity captured = capturedBox.isEmpty
        ? const CapturedPokemonsEntity(<CapturedPokemonEntity>[])
        : capturedBox.get('pokemons')!;

    //creates a new list making a union with the old
    // pokemons and the new one, then saves
    // it in the box of the authenticated user
    capturedBox.put(
      'pokemons',
      CapturedPokemonsEntity(
        List.from(captured.pokemonslist)
          ..add(
            CapturedPokemonEntity(
              id: id,
              name: name,
            ),
          ),
      ),
    );
  }

  Box<CapturedPokemonsEntity> _getBoxFromAuthenticatedUser() {
    var boxKey = Modular.get<AuthenticationController>().state.id;
    var capturedBox = Hive.box<CapturedPokemonsEntity>(boxKey);
    return capturedBox;
  }

  @override
  Future<CapturedPokemonsEntity> getCapturedPokemons() async {
    Box<CapturedPokemonsEntity> capturedBox = _getBoxFromAuthenticatedUser();

    CapturedPokemonsEntity capturedList = capturedBox.isEmpty
        ? const CapturedPokemonsEntity(<CapturedPokemonEntity>[])
        : capturedBox.get('pokemons')!;
    return capturedList;
  }

  @override
  Future<bool> releasePokemon(int id) async {
    Box<CapturedPokemonsEntity> capturedBox = _getBoxFromAuthenticatedUser();
    var captured = capturedBox.get('pokemons');

    //Search the index of the desired pokemon
    int index =
        captured!.pokemonslist.indexWhere((captured) => captured.id == id);

    //if it is a positive index it will remove it from the list and return it
    if (index >= 0) {
      captured.pokemonslist.removeAt(index);
      capturedBox.put('pokemons', captured);
      return true;
    } else {
      return false;
    }
  }
}
