import 'package:pokedex_azul/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:pokedex_azul/features/domain/repositories/authentication_repository.dart';

import '../data_sources/authentication_datasource.dart';
import '../models/user_model.dart';

class AuthenticationRepositoryImplementation
    implements IAuthenticationRepository {
  final IAuthenticationDatasource _datasource;

  const AuthenticationRepositoryImplementation(this._datasource);

  @override
  Future<Either<Failure, UserModel?>> signInWithGoogleAndGetUser() async {
    var user = await _datasource.signInWithGoogle();
    if (user != null) {
      return Right(user);
    }
    return Left(AuthenticationFailure());
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    var out = await _datasource.signOut();
    if (out) {
      return const Right(true);
    }
    return Left(AuthenticationFailure());
  }
}
