import 'package:email_auth/email_auth.dart';

class VerifyOtpUseCase {
  EmailAuth emailAuth;

  VerifyOtpUseCase({required this.emailAuth});

  Future<bool> call({required String email, required String otpCode}) async {
    return emailAuth.validateOtp(recipientMail: email, userOtp: otpCode);
  }
}
