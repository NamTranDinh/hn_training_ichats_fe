import 'package:i_chat/src/domain/entities/user_entity.dart';
import 'package:i_chat/src/domain/repositories/auth_repos/firebase_repos.dart';

class SignUpUseCase{
  final FirebaseRepos firebaseRepos;

  SignUpUseCase({required this.firebaseRepos});

  Future<void> call(UserEntity userEntity){
    return firebaseRepos.signUp(userEntity);
  }
}