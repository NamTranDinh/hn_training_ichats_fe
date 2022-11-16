import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_chat/src/domain/use_cases/auth_usecase/get_id_user_current_usecase.dart';
import 'package:i_chat/src/domain/use_cases/auth_usecase/is_signedin_usecase.dart';
import 'package:i_chat/src/domain/use_cases/auth_usecase/signout_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignOutUseCase signOutUseCase;
  final IsSignedInUseCase isSignedInUseCase;
  final GetIdUserCurrentUseCase getIdUserCurrentUseCase;

  AuthCubit({
    required this.signOutUseCase,
    required this.isSignedInUseCase,
    required this.getIdUserCurrentUseCase,
  }) : super(AuthInitial());

  Future<void> initApp() async {
    try {
      final isUserSignedIn = await isSignedInUseCase.call();

      if (isUserSignedIn) {
        final userId = await getIdUserCurrentUseCase.call();
        emit(Authenticated(userId: userId));
      } else {
        emit(const UnAuthenticated(mess: 'UnAuthenticated State initApp'));
      }
    } on SocketException catch (e) {
      emit(UnAuthenticated(mess: e.message));
    }
  }

  Future<void> signedOut() async {
    try {
      signOutUseCase.call();
      emit(const UnAuthenticated(mess: 'UnAuthenticated State signedOut'));
    } on SocketException catch (e) {
      emit(UnAuthenticated(mess: e.message));
    }
  }

  Future<void> signedIn() async {
    try {
      final userId = await getIdUserCurrentUseCase.call();
      emit(Authenticated(userId: userId));
    } on SocketException catch (e) {
      emit(UnAuthenticated(mess: e.message));
    }
  }
}
