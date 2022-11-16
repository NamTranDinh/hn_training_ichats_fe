import 'package:i_chat/src/domain/repositories/firebase_auth_repo.dart';

class IsSignedInUseCase {
  final FirebaseAuthRepo firebaseAuthRepo;

  IsSignedInUseCase({required this.firebaseAuthRepo});

  Future<bool> call(){
    return firebaseAuthRepo.isSignedIn();
  }
}
