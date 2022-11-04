import 'package:flutter/material.dart';
import '../../../config/theme/app_color.dart';
import '../../widgets/layout/auth_layouts/forget_password_layout/body.dart';
import '../../widgets/layout/auth_layouts/forget_password_layout/footer.dart';
import '../../widgets/layout/auth_layouts/forget_password_layout/header.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
