import '../models/user_model.dart';

abstract class IAuthenticationDatasource {
  Future<UserModel?> signInWithGoogle();
  Future<bool> signOut();
}
