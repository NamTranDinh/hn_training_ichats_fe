import 'package:email_auth/email_auth.dart';

class SentOtpUseCase {
  EmailAuth emailAuth;

  SentOtpUseCase({required this.emailAuth});

  Future<bool> call({required String email}) async {
    print('sessionName : ${emailAuth.sessionName}');
    return emailAuth.sendOtp(recipientMail: email);
  }
}
