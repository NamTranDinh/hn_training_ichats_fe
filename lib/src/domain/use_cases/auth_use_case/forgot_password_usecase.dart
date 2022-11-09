import 'package:i_chat/src/domain/repositories/auth_repos/firebase_repos.dart';

class ForgotPasswordUseCase{
  final FirebaseRepos firebaseRepos;

  ForgotPasswordUseCase({required this.firebaseRepos});

  Future<void> forgotPassword(String email){
    return firebaseRepos.forgotPassword(email);
  }
}