import 'package:pokedex_azul/core/errors/failures.dart';

import 'package:dartz/dartz.dart';

import '../../../core/usecase/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/authentication_repository.dart';

class AuthenticationUsecase implements Usecase<UserEntity?, NoParams> {
  final IAuthenticationRepository _repository;

  const AuthenticationUsecase(this._repository);
  @override
  Future<Either<Failure, UserEntity?>> call(params) async {
    return await _repository.signInWithGoogleAndGetUser();
  }
}
