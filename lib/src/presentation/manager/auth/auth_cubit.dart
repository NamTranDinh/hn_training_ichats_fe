import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_chat/src/domain/use_cases/auth_use_case/get_Current_user_id_usecase.dart';

import '../../../domain/use_cases/auth_use_case/is_sign_in_usecase.dart';
import '../../../domain/use_cases/auth_use_case/sign_out_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IsSignInUseCase isSignInUseCase;
  final GetCurrentUserIdUseCase getCurrentUserIdUseCase;
  final SignOutUseCase signOutUseCase;

  AuthCubit({
    required this.isSignInUseCase,
    required this.signOutUseCase,
    required this.getCurrentUserIdUseCase,
  }) : super(AuthInitial());

  ///
  Future<void> appStarted() async {
    try {
      final isSignIn = await isSignInUseCase.call();
      if (isSignIn) {
        final userId = await getCurrentUserIdUseCase.call();
        emit(AuthenticatedState(userId: userId));
      } else {
        emit(UnAuthenticatedState());
      }
    } on SocketException catch (_) {}
  }

  ///
  Future<void> isSignedInSuccess() async {
    try {
      final userId = await getCurrentUserIdUseCase.call();
      emit(AuthenticatedState(userId: userId));
    } on SocketException catch (_) {}
  }

  ///
  Future<void> signOut() async {
    try {
      await signOutUseCase.call();
      emit(UnAuthenticatedState());
    } on SocketException catch (_) {}
  }
}
