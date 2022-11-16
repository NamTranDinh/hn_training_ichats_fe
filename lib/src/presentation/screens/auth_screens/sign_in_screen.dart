import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_chat/src/config/theme/app_color.dart';
import 'package:i_chat/src/presentation/cubiT/auth/auth_cubit.dart';
import 'package:i_chat/src/presentation/cubiT/credential/credential_cubit.dart';
import 'package:i_chat/src/presentation/screens/auth_screens/welcome_screen.dart';
import 'package:i_chat/src/presentation/screens/iChats_screens/iChats_screen.dart';
import 'package:i_chat/toast_utils.dart';

import '../../widgets/layout/auth_layouts/signin_layout/body.dart';
import '../../widgets/layout/auth_layouts/signin_layout/footer.dart';
import '../../widgets/layout/auth_layouts/signin_layout/header.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CredentialCubit, CredentialState>(
      listener: (context, credentialState) {
        /// here the listener state will be emitted from the `CredentialCubit` vio `emit`
        if (credentialState is CredentialSuccess) {
          BlocProvider.of<AuthCubit>(context).signedIn();
          ToastUtils.showToast('CredentialSuccess sign in');
        }
        if (credentialState is CredentialFailure) {
          ToastUtils.showToast('CredentialFailure sign in');
        }
      },
      builder: (context, credentialState) {
        if (credentialState is CredentialLoading) {
          return const WelcomeScreen();
        }
        if (credentialState is CredentialSuccess) {
          return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
            if (authState is Authenticated) {
              return IChatsScreen(userId: authState.userId);
            } else {
              return _container();
            }
          });
        }
        if (credentialState is CredentialFailure) {}

        return _container();
      },
    );
  }

  Widget _container() {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: backgroundColorApp,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(3),
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Header(),
                      Body(),
                    ],
                  ),
                  const Align(
                      alignment: Alignment.bottomCenter, child: Footer()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
