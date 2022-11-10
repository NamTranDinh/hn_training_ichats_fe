import 'package:i_chat/src/domain/entities/user_entity.dart';
import 'package:i_chat/src/domain/repositories/auth_repos/firebase_repos.dart';

class GetCreateCurrentUserUseCase {
  final FirebaseRepos firebaseRepos;

  GetCreateCurrentUserUseCase({required this.firebaseRepos});

  Future<void> call(UserEntity userEntity){
    return firebaseRepos.getCreateCurrentUser(userEntity);
  }
}