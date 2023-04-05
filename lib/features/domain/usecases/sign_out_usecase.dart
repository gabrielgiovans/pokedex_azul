import 'package:pokedex_azul/core/errors/failures.dart';

import 'package:dartz/dartz.dart';

import '../../../core/usecase/usecase.dart';
import '../repositories/authentication_repository.dart';

class SignOutUsecase implements Usecase<bool?, NoParams> {
  final IAuthenticationRepository _repository;

  const SignOutUsecase(this._repository);

  @override
  Future<Either<Failure, bool?>> call(NoParams params) async {
    return await _repository.signOut();
  }
}
