import 'package:i_chat/src/domain/repositories/auth_repos/firebase_repos.dart';

class SignOutUseCase{
  final FirebaseRepos firebaseRepos;

  SignOutUseCase({required this.firebaseRepos});

  Future<void> call(){
    return firebaseRepos.signOut();
  }
}