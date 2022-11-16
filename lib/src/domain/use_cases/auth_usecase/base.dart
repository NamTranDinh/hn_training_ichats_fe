import 'package:i_chat/injections/injection_container.dart';
import 'package:i_chat/src/domain/repositories/firebase_auth_repo.dart';

abstract class BaseLoginUseCase {
  FirebaseAuthRepo repository = instance<FirebaseAuthRepo>();
}