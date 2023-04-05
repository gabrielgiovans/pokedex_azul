import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../entities/user_entity.dart';

abstract class IAuthenticationRepository {
  Future<Either<Failure, UserEntity?>> signInWithGoogleAndGetUser();
  Future<Either<Failure, bool>> signOut();
}
