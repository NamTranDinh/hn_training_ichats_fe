import 'package:i_chat/src/domain/repositories/firebase_auth_repo.dart';

class GetIdUserCurrentUseCase {
  final FirebaseAuthRepo firebaseAuthRepo;

  GetIdUserCurrentUseCase({required this.firebaseAuthRepo});

  Future<String> call(){
    return firebaseAuthRepo.getIdUserCurrent();
  }
}
