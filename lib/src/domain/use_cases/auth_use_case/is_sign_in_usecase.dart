import 'package:i_chat/src/domain/entities/user_entity.dart';
import 'package:i_chat/src/domain/repositories/auth_repos/firebase_repos.dart';

class IsSignInUseCase{
  final FirebaseRepos firebaseRepos;

  IsSignInUseCase({required this.firebaseRepos});

  Future<bool> isSignIn(){
    return firebaseRepos.isSignIn();
  }
}