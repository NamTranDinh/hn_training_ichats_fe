import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:i_chat/src/data/remote_data_sources/auth_data_src/firebase_remote_data_src.dart';
import 'package:i_chat/src/data/remote_data_sources/firebase_remote_data_impl.dart';
import 'package:i_chat/src/data/repositories/firebase_auth_impl.dart';
import 'package:i_chat/src/domain/repositories/firebase_auth_repo.dart';
import 'package:i_chat/src/domain/use_cases/auth_usecase/get_id_user_current_usecase.dart';
import 'package:i_chat/src/domain/use_cases/auth_usecase/is_signedin_usecase.dart';
import 'package:i_chat/src/domain/use_cases/auth_usecase/save_info_current_user.dart';
import 'package:i_chat/src/domain/use_cases/auth_usecase/signin_usecase.dart';
import 'package:i_chat/src/domain/use_cases/auth_usecase/signout_usecase.dart';
import 'package:i_chat/src/domain/use_cases/otp_usecase/sent_otp_usecase.dart';
import 'package:i_chat/src/domain/use_cases/otp_usecase/verify_otp_usecase.dart';
import 'package:i_chat/src/presentation/cubiT/auth/auth_cubit.dart';
import 'package:i_chat/src/presentation/cubiT/credential/credential_cubit.dart';
import 'package:i_chat/src/presentation/cubiT/otp/otp_cubit.dart';

import '../src/domain/use_cases/auth_usecase/signup_usecase.dart';

final instance = GetIt.instance;

Future<void> init() async {
  /// register object cubit
  instance.registerFactory<AuthCubit>(() => AuthCubit(
        signOutUseCase: instance.call(),
        isSignedInUseCase: instance.call(),
        getIdUserCurrentUseCase: instance.call(),
      ));

  instance.registerFactory<CredentialCubit>(() => CredentialCubit(
        signInUseCase: instance.call(),
        signUpUseCase: instance.call(),
        saveInfoCurrentUserUseCase: instance.call(),
        signOutUseCase: instance.call(),
      ));

  instance.registerFactory<OtpCubit>(() => OtpCubit(
        verifyOtpUseCase: instance.call(),
        sentOtpUseCase: instance.call(),
      ));

  /// register object use case of auth
  //  final SignOutUseCase;
  //  final IsSignedInUseCase;
  //  final GetIdUserCurrentUseCase;
  instance.registerLazySingleton<SignOutUseCase>(() => SignOutUseCase(
        firebaseAuthRepo: instance.call(),
      ));
  instance.registerLazySingleton<IsSignedInUseCase>(() => IsSignedInUseCase(
        firebaseAuthRepo: instance.call(),
      ));
  instance.registerLazySingleton<GetIdUserCurrentUseCase>(
      () => GetIdUserCurrentUseCase(
            firebaseAuthRepo: instance.call(),
          ));

  /// register object use case of credential
  //  final SignInUseCase;
  //  final SignUpUseCase;
  //  final SaveInfoCurrentUserUseCase;
  instance.registerLazySingleton<SignInUseCase>(() => SignInUseCase());
  instance.registerLazySingleton<SignUpUseCase>(() => SignUpUseCase(
        firebaseAuthRepo: instance.call(),
      ));
  instance.registerLazySingleton<SaveInfoCurrentUserUseCase>(
      () => SaveInfoCurrentUserUseCase(
            firebaseAuthRepo: instance.call(),
          ));

  /// register object use case of otp
  // final SentOtpUseCase;
  // final VerifyOtpUseCase;
  instance.registerLazySingleton<SentOtpUseCase>(() => SentOtpUseCase(
        emailAuth: instance.call(),
      ));
  instance.registerLazySingleton<VerifyOtpUseCase>(() => VerifyOtpUseCase(
        emailAuth: instance.call(),
      ));

  /// register object repository of domain
  instance.registerLazySingleton<FirebaseAuthRepo>(() => FirebaseAuthImpl(
        firebaseRemoteDataSrc: instance.call(),
      ));

  /// register object repository of data
  instance.registerLazySingleton<FirebaseRemoteDataSrc>(
      () => FirebaseRemoteDataImpl(
            firebaseAuth: instance.call(),
            fireStore: instance.call(),
          ));

  /// external ??
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  final emailAuth = EmailAuth(sessionName: 'Ichats');

  instance.registerSingleton(auth);
  instance.registerSingleton(fireStore);
  instance.registerSingleton(emailAuth);
}
