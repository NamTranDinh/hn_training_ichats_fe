import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_chat/src/presentation/cubiT/otp/otp_cubit.dart';
import 'package:i_chat/src/presentation/screens/auth_screens/reset_password_screen.dart';
import 'package:i_chat/toast_utils.dart';
import '../../widgets/layout/auth_layouts/otp_layout/header.dart';
import '../../widgets/layout/auth_layouts/otp_layout/body.dart';
import '../../widgets/layout/auth_layouts/otp_layout/footer.dart';
import '../../../config/theme/app_color.dart';

class OtpScreen extends StatefulWidget {
  final String email;

  const OtpScreen({super.key, required this.email});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtpCubit, OtpState>(
      builder: (context, otpState) {
        if (otpState is OnLoading) {}
        if (otpState is VerifyOtpSuccess) {
          ToastUtils.showToast('Verify otp correct!');
          return const ResetPasswordScreen();
        }
        if (otpState is OnFailure) {
          ToastUtils.showToast('Verify otp wrong!');
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
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Header(),
                    Body(email: '',),
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
