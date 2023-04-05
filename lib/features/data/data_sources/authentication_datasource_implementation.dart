import 'package:google_sign_in/google_sign_in.dart';
import 'package:pokedex_azul/features/data/data_sources/authentication_datasource.dart';

import '../../../core/errors/exceptions.dart';
import '../models/user_model.dart';

class AuthenticationDatasourceImplementation
    implements IAuthenticationDatasource {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  @override
  Future<UserModel?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser != null) {
      return UserModel(
        id: googleUser.id,
        displayName: googleUser.displayName ?? '',
        email: googleUser.email,
        photoUrl: googleUser.photoUrl ?? '',
      );
    }
    throw AuthenticationException();
  }

  @override
  Future<bool> signOut() async {
    try {
      await _googleSignIn.signOut();
      return true;
    } catch (error) {
      throw AuthenticationException();
    }
  }
}
