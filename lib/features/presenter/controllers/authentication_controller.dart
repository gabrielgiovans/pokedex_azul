import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pokedex_azul/core/usecase/usecase.dart';
import 'package:pokedex_azul/features/domain/usecases/sign_out_usecase.dart';

import '../../domain/entities/captured_pokemons_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/authentication_usecase.dart';

class AuthenticationController extends Store<UserEntity> {
  AuthenticationController(
    this._signOutUsecase,
    this._authenticationUseCase,
  ) : super(
          const UserEntity(
            id: '',
            email: '',
            displayName: '',
            photoUrl: '',
          ),
        );

  final AuthenticationUsecase _authenticationUseCase;
  final SignOutUsecase _signOutUsecase;

  //Responsible for authenticating the user and if successful,
  //open the box of captured pokemons and take it to the home screen
  Future<void> signInWithGoogleAndGetUser() async {
    setLoading(true);
    final result = await _authenticationUseCase(NoParams());
    result.fold((error) => setError(error), (success) async {
      update(success!);
      await Hive.openBox<CapturedPokemonsEntity>(success.id);
      Modular.to.pushReplacementNamed('/home');
    });
    setLoading(false);
  }

  Future<void> signOut() async {
    setLoading(true);
    final result = await _signOutUsecase(NoParams());
    result.fold((error) => setError(error), (success) {
      Modular.to.pushNamedAndRemoveUntil(
        '/',
        (route) => false,
      );
    });
    setLoading(false);
  }
}
