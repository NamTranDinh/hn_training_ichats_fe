import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_chat/src/config/app_const.dart';
import 'package:i_chat/src/presentation/cubiT/otp/otp_cubit.dart';
import 'package:i_chat/toast_utils.dart';
import '../../../config/theme/app_color.dart';
import '../../widgets/layout/auth_layouts/forget_password_layout/body.dart';
import '../../widgets/layout/auth_layouts/forget_password_layout/footer.dart';
import '../../widgets/layout/auth_layouts/forget_password_layout/header.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  var emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtpCubit, OtpState>(
      builder: (context, otpState) {
        if (otpState is OnLoading) {
          // return const WelcomeScreen();
        }
        if (otpState is OtpSuccess) {
          Navigator.pushNamed(context, RouteConst.getOtpRoute,
              arguments: emailController.text.trim());
        }
        if (otpState is OnFailure) {
          ToastUtils.showToast('Sent otp failure');
        }
        return _container();
      },
    );
  }

  Widget _container() {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColorApp,
        body: Container(
          padding: const EdgeInsets.only(bottom: 3),
          height: MediaQuery
              .of(context)
              .size
              .height,
          child: Center(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Header(),
                    Body(emailController: emailController),
                  ],
                ),
                const Align(alignment: Alignment.bottomCenter, child: Footer()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
