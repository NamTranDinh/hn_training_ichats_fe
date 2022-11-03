import 'package:flutter/material.dart';
import '../../widgets/layout/auth_pages/signin_page/body.dart';
import '../../widgets/layout/auth_pages/signin_page/footer.dart';
import '../../widgets/layout/auth_pages/signin_page/header.dart';
import '../../widgets/theme/app_color.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  const Align(alignment: Alignment.bottomCenter, child: Footer()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
