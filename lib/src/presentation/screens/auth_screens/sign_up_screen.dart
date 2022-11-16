import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_chat/src/presentation/screens/auth_screens/sign_in_screen.dart';
import 'package:i_chat/src/presentation/screens/auth_screens/welcome_screen.dart';
import '../../../../toast_utils.dart';
import '../../cubiT/auth/auth_cubit.dart';
import '../../cubiT/credential/credential_cubit.dart';
import '../../widgets/layout/auth_layouts/signup_layout/body.dart';
import '../../widgets/layout/auth_layouts/signup_layout/footer.dart';
import '../../widgets/layout/auth_layouts/signup_layout/header.dart';
import '../../../config/theme/app_color.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CredentialCubit, CredentialState>(
      listener: (context, credentialState) {
        /// here the listener state will be emitted from the `CredentialCubit` vio `emit`
        if (credentialState is CredentialSuccess) {
          BlocProvider.of<AuthCubit>(context).signedIn();
          ToastUtils.showToast('CredentialSuccess sign up');
        }
        if (credentialState is CredentialFailure) {
          ToastUtils.showToast('CredentialFailure sign up');
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
                return const SignInScreen();
              } else {
                return _container();
              }
            },
          );
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
            // color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
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
