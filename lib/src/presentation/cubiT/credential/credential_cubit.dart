import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_chat/src/domain/entities/user_entity.dart';
import 'package:i_chat/src/domain/use_cases/auth_usecase/save_info_current_user.dart';
import 'package:i_chat/src/domain/use_cases/auth_usecase/signin_usecase.dart';
import 'package:i_chat/src/domain/use_cases/auth_usecase/signout_usecase.dart';
import 'package:i_chat/src/domain/use_cases/auth_usecase/signup_usecase.dart';

part 'credential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final SignOutUseCase signOutUseCase;
  final SaveInfoCurrentUserUseCase saveInfoCurrentUserUseCase;

  CredentialCubit({
    required this.signOutUseCase,
    required this.saveInfoCurrentUserUseCase,
    required this.signInUseCase,
    required this.signUpUseCase,
  }) : super(CredentialInitial());

  Future<void> onSubmitSignOut() async {
    emit(CredentialLoading());
    try {
      await signOutUseCase.call();
      emit(CredentialSuccess());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  Future<void> onSubmitSignIn({required UserEntity userEntity}) async {
    emit(CredentialLoading());
    try {
      await signInUseCase.call(userEntity);
      emit(CredentialSuccess());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  Future<void> onSubmitSignUp({required UserEntity userEntity}) async {
    emit(CredentialLoading());
    try {
      await signUpUseCase.call(userEntity);
      await saveInfoCurrentUserUseCase.call(userEntity);
      emit(CredentialSuccess());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }
}
