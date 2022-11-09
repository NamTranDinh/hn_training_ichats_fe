import 'package:i_chat/src/domain/entities/user_entity.dart';

abstract class FirebaseRepos {
  /// credential section
  Future<void> signIn(UserEntity userEntity);

  Future<void> signUp(UserEntity userEntity);

  Future<void> forgotPassword(String email);

  Future<void> getUpdateUser(UserEntity userEntity);

  Future<void> getCreateCurrentUser(UserEntity userEntity);

  Future<void> getCurrentUserId();

  Future<bool> isSignIn();

  Future<void> signOut();
}
