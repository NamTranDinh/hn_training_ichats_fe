import 'package:i_chat/src/domain/entities/user_entity.dart';
import 'package:i_chat/src/domain/repositories/auth_repos/firebase_repos.dart';

class SignInUseCase{
  final FirebaseRepos firebaseRepos;

  SignInUseCase({required this.firebaseRepos});

  Future<void> call(UserEntity userEntity){
    return firebaseRepos.signIn(userEntity);
  }
}