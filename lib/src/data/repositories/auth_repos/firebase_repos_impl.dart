import 'package:i_chat/src/data/remote_data_sources/auth_data_src/firebase_remote_data_resources.dart';
import 'package:i_chat/src/domain/entities/user_entity.dart';
import 'package:i_chat/src/domain/repositories/auth_repos/firebase_repos.dart';

class FireBaseReposImpl implements FirebaseRepos {
  final FirebaseRemoteDataResources firebaseRemoteDataResources;

  FireBaseReposImpl({required this.firebaseRemoteDataResources});

  @override
  Future<void> forgotPassword(String email) =>
      firebaseRemoteDataResources.forgotPassword(email);

  @override
  Future<void> getCreateCurrentUser(UserEntity userEntity) =>
      firebaseRemoteDataResources.getCreateCurrentUser(userEntity);

  @override
  Future<void> getCurrentUserId() =>
      firebaseRemoteDataResources.getCurrentUserId();

  @override
  Future<void> getUpdateUser(UserEntity userEntity) =>
      getUpdateUser(userEntity);

  @override
  Future<bool> isSignIn() => firebaseRemoteDataResources.isSignIn();

  @override
  Future<void> signIn(UserEntity userEntity) =>
      firebaseRemoteDataResources.signIn(userEntity);

  @override
  Future<void> signOut() => firebaseRemoteDataResources.signOut();

  @override
  Future<void> signUp(UserEntity userEntity) =>
      firebaseRemoteDataResources.signUp(userEntity);
}
