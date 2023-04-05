import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../errors/failures.dart';

abstract class Usecase<Output, Input> {
  Future<Either<Failure, Output>> call(Input params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthenticationParams extends Equatable {
  final String email;
  final String password;

  const AuthenticationParams(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class CapturePokemonParams extends Equatable {
  final int id;
  final String name;

  const CapturePokemonParams(this.id, this.name);

  @override
  List<Object?> get props => [id, name];
}
