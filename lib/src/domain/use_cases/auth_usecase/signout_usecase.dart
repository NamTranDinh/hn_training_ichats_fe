import 'package:i_chat/src/domain/repositories/firebase_auth_repo.dart';

class SignOutUseCase {
  final FirebaseAuthRepo firebaseAuthRepo;

  SignOutUseCase({required this.firebaseAuthRepo});

  Future<void> call(){
    return firebaseAuthRepo.signOut();
  }
}
