import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:i_chat/src/data/remote_data_sources/firebase_remote_data_resource_impl.dart';
import 'package:i_chat/src/data/repositories/auth_repos/firebase_repos_impl.dart';
import 'package:i_chat/src/domain/repositories/auth_repos/firebase_repos.dart';
import 'package:i_chat/src/domain/use_cases/auth_use_case/forgot_password_usecase.dart';
import 'package:i_chat/src/domain/use_cases/auth_use_case/get_Current_user_id_usecase.dart';
import 'package:i_chat/src/domain/use_cases/auth_use_case/get_create_current_user_usecase.dart';
import 'package:i_chat/src/domain/use_cases/auth_use_case/is_sign_in_usecase.dart';
import 'package:i_chat/src/domain/use_cases/auth_use_case/sign_in_usecase.dart';
import 'package:i_chat/src/domain/use_cases/auth_use_case/sign_out_usecase.dart';
import 'package:i_chat/src/domain/use_cases/auth_use_case/sign_up_usecase.dart';
import 'package:i_chat/src/presentation/manager/auth/auth_cubit.dart';
import 'package:i_chat/src/presentation/manager/credential/credential_cubit.dart';

final instance = GetIt.instance;

Future<void> init() async {
  /// bloc/cubit
  instance.registerFactory(
    () => AuthCubit(
      isSignInUseCase: instance.call(),
      signOutUseCase: instance.call(),
      getCurrentUserIdUseCase: instance.call(),
    ),
  );

  instance.registerFactory(
    () => CredentialCubit(
        signInUseCase: instance.call(),
        signUpUseCase: instance.call(),
        forgotPasswordUseCase: instance.call(),
        getCreateCurrentUserUseCase: instance.call()),
  );

  /// use case
  // auth cubit use case
  instance.registerLazySingleton<GetCurrentUserIdUseCase>(
    () => GetCurrentUserIdUseCase(firebaseRepos: instance.call()),
  );
  instance.registerLazySingleton<IsSignInUseCase>(
    () => IsSignInUseCase(firebaseRepos: instance.call()),
  );
  instance.registerLazySingleton<SignOutUseCase>(
    () => SignOutUseCase(firebaseRepos: instance.call()),
  );
  // credential cubit use case
  instance.registerLazySingleton<SignUpUseCase>(
    () => SignUpUseCase(firebaseRepos: instance.call()),
  );
  instance.registerLazySingleton<SignInUseCase>(
    () => SignInUseCase(firebaseRepos: instance.call()),
  );
  instance.registerLazySingleton<ForgotPasswordUseCase>(
    () => ForgotPasswordUseCase(firebaseRepos: instance.call()),
  );
  instance.registerLazySingleton<GetCreateCurrentUserUseCase>(
    () => GetCreateCurrentUserUseCase(firebaseRepos: instance.call()),
  );

  /// repo
  instance.registerLazySingleton<FirebaseRepos>(
    () => FireBaseReposImpl(firebaseRemoteDataResources: instance.call()),
  );

  /// remote data src
  instance.registerLazySingleton<FirebaseRemoteDataResourceImpl>(
    () => FirebaseRemoteDataResourceImpl(
        firebaseFireStore: instance.call(), firebaseAuth: instance.call()),
  );

  /// local data src

  /// external
  final authInstance = FirebaseAuth.instance;
  final fireStoreInstance = FirebaseFirestore.instance;

  instance.registerLazySingleton(() => authInstance);
  instance.registerLazySingleton(() => fireStoreInstance);
}
