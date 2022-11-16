import '../../../domain/entities/user_entity.dart';

abstract class FirebaseRemoteDataSrc {
  Future<void> signInWithAuth(UserEntity userEntity);

  Future<void> signUpWithAuth(UserEntity userEntity);

  Future<String> getIdUserCurrent();

  Future<void> saveInfoCurrentUser(UserEntity userEntity);

  Future<void> signOut();

  Future<bool> isSignedIn();
}
