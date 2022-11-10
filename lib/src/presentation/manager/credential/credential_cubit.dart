import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_chat/src/domain/entities/user_entity.dart';
import 'package:i_chat/src/domain/use_cases/auth_use_case/forgot_password_usecase.dart';
import 'package:i_chat/src/domain/use_cases/auth_use_case/get_create_current_user_usecase.dart';

import '../../../domain/use_cases/auth_use_case/sign_in_usecase.dart';
import '../../../domain/use_cases/auth_use_case/sign_up_usecase.dart';

part 'credential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;

  final GetCreateCurrentUserUseCase getCreateCurrentUserUseCase;

  CredentialCubit({
    required this.signInUseCase,
    required this.signUpUseCase,
    required this.forgotPasswordUseCase,
    required this.getCreateCurrentUserUseCase,
  }) : super(CredentialInitial());

  ///
  Future<void> submitSignIn({required UserEntity userEntity}) async {
    try {
      await signInUseCase.call(userEntity);
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  ///
  Future<void> submitSignUn({required UserEntity userEntity}) async {
    try {
      await signUpUseCase.call(userEntity);
      await getCreateCurrentUserUseCase.call(userEntity);
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  ///
  Future<void> forgotPassword({required UserEntity userEntity}) async {
    try {
      await forgotPasswordUseCase.call(userEntity.email!);
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }
}
