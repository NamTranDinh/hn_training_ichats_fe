import 'package:i_chat/src/domain/entities/user_entity.dart';
import 'package:i_chat/src/domain/repositories/auth_repos/firebase_repos.dart';

class GetUpdateUserUseCase{
  final FirebaseRepos firebaseRepos;

  GetUpdateUserUseCase({required this.firebaseRepos});

  Future<void> getCreateCurrentUser(UserEntity userEntity){
    return firebaseRepos.getCreateCurrentUser(userEntity);
  }
}