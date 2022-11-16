import 'package:i_chat/src/domain/entities/user_entity.dart';
import 'package:i_chat/src/domain/repositories/firebase_auth_repo.dart';

class SignUpUseCase {
  final FirebaseAuthRepo firebaseAuthRepo;

  SignUpUseCase({required this.firebaseAuthRepo});

  Future<void> call(UserEntity userEntity){
    return firebaseAuthRepo.signUpWithAuth(userEntity);
  }
}
