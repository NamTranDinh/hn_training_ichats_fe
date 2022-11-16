part of 'otp_cubit.dart';

abstract class OtpState extends Equatable {
  const OtpState();
}

class OtpInitial extends OtpState {
  @override
  List<Object> get props => [];
}

class OnLoading extends OtpState {
  @override
  List<Object> get props => [];
}

class OtpSuccess extends OtpState {
  final String email;

  const OtpSuccess({required this.email});

  @override
  List<Object> get props => [email];
}

class VerifyOtpSuccess extends OtpState {
  final String email;

  const VerifyOtpSuccess({required this.email});

  @override
  List<Object> get props => [email];
}

class OnFailure extends OtpState {
  final String msg;

  const OnFailure({required this.msg});

  @override
  List<Object> get props => [msg];
}
