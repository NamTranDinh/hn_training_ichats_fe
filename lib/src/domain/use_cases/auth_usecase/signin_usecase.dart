import 'package:i_chat/src/domain/entities/user_entity.dart';
import 'package:i_chat/src/domain/repositories/firebase_auth_repo.dart';

import 'base.dart';

// class SignInUseCase {
//   final FirebaseAuthRepo firebaseAuthRepo;
//
//   SignInUseCase({required this.firebaseAuthRepo});
//
//   Future<void> call(UserEntity userEntity) {
//     return firebaseAuthRepo.signInWithAuth(userEntity);
//   }
// }

class SignInUseCase extends BaseLoginUseCase{
  Future<void> call(UserEntity userEntity) {
    return repository.signInWithAuth(userEntity);
  }
}
