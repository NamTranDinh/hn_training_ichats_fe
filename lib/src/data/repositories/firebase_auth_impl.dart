import 'package:i_chat/src/data/remote_data_sources/auth_data_src/firebase_remote_data_src.dart';
import 'package:i_chat/src/domain/entities/user_entity.dart';
import 'package:i_chat/src/domain/repositories/firebase_auth_repo.dart';

class FirebaseAuthImpl implements FirebaseAuthRepo {
  final FirebaseRemoteDataSrc firebaseRemoteDataSrc;

  FirebaseAuthImpl({required this.firebaseRemoteDataSrc});

  @override
  Future<void> signInWithAuth(UserEntity userEntity) {
    return firebaseRemoteDataSrc.signInWithAuth(userEntity);
  }

  @override
  Future<void> signUpWithAuth(UserEntity userEntity) {
    return firebaseRemoteDataSrc.signUpWithAuth(userEntity);
  }

  @override
  Future<void> signOut() {
    return firebaseRemoteDataSrc.signOut();
  }

  @override
  Future<bool> isSignedIn() {
    return firebaseRemoteDataSrc.isSignedIn();
  }

  @override
  Future<String> getIdUserCurrent() {
    return firebaseRemoteDataSrc.getIdUserCurrent();
  }

  @override
  Future<void> saveInfoCurrentUser(UserEntity userEntity) {
    return firebaseRemoteDataSrc.saveInfoCurrentUser(userEntity);
  }


}
