import 'package:i_chat/src/domain/repositories/auth_repos/firebase_repos.dart';

class IsSignInUseCase{
  final FirebaseRepos firebaseRepos;

  IsSignInUseCase({required this.firebaseRepos});

  Future<bool> call(){
    return firebaseRepos.isSignIn();
  }
}