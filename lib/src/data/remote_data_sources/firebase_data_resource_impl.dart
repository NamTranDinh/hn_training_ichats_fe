import 'package:i_chat/src/data/remote_data_sources/auth_data_src/firebase_remote_data_resources.dart';
import 'package:i_chat/src/domain/entities/user_entity.dart';

class FirebaseDataResourceImpl implements FirebaseRemoteDataResources {
  @override
  Future<void> forgotPassword(String email) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<void> getCreateCurrentUser(UserEntity userEntity) {
    // TODO: implement getCreateCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<void> getCurrentUserId() {
    // TODO: implement getCurrentUserId
    throw UnimplementedError();
  }

  @override
  Future<void> getUpdateUser(UserEntity userEntity) {
    // TODO: implement getUpdateUser
    throw UnimplementedError();
  }

  @override
  Future<bool> isSignIn() {
    // TODO: implement isSignIn
    throw UnimplementedError();
  }

  @override
  Future<void> signIn(UserEntity userEntity) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(UserEntity userEntity) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
