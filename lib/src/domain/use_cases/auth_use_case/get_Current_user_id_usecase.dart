import 'package:i_chat/src/domain/repositories/auth_repos/firebase_repos.dart';

class GetCurrentUserIdUseCase{
  final FirebaseRepos firebaseRepos;

  GetCurrentUserIdUseCase({required this.firebaseRepos});

  Future<String> call(){
    return firebaseRepos.getCurrentUserId();
  }
}