import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_chat/src/domain/use_cases/otp_usecase/sent_otp_usecase.dart';
import 'package:i_chat/src/domain/use_cases/otp_usecase/verify_otp_usecase.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  final SentOtpUseCase sentOtpUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;

  OtpCubit({
    required this.verifyOtpUseCase,
    required this.sentOtpUseCase,
  }) : super(OtpInitial());

  Future<void> onSubmitSentOtp(String email) async {
    emit(OnLoading());
    bool res = await sentOtpUseCase.call(email: email);
    if (res) {
      emit(OtpSuccess(email: email));
    } else {
      emit(const OnFailure(msg: 'Sent otp failure!!'));
    }
  }

  Future<void> onSubmitVerifyOtp(
      {required String email, required String otpCode}) async {
    emit(OnLoading());
    bool res = await verifyOtpUseCase.call(email: email, otpCode: otpCode);
    if (res) {
      emit(VerifyOtpSuccess(email: email));
    } else {
      emit(const OnFailure(msg: 'Verify otp failure!!'));
    }
  }
}
