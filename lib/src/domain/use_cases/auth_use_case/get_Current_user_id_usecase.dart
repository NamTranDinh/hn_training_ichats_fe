import 'package:i_chat/src/domain/entities/user_entity.dart';
import 'package:i_chat/src/domain/repositories/auth_repos/firebase_repos.dart';

class GetCurrentUserIdUseCase{
  final FirebaseRepos firebaseRepos;

  GetCurrentUserIdUseCase({required this.firebaseRepos});

  Future<void> getCurrentUserId(){
    return firebaseRepos.getCurrentUserId();
  }
}