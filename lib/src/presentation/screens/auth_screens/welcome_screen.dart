import 'dart:async';

import 'package:flutter/material.dart';
import 'package:i_chat/src/config/theme/app_color.dart';
import 'package:i_chat/src/presentation/screens/auth_screens/sign_in_screen.dart';
import 'package:i_chat/src/presentation/widgets/drawable/row_text.dart';
import 'package:lottie/lottie.dart';

import '../../widgets/layout/auth_layouts/signin_layout/footer.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(milliseconds: 5000),
            () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const SignInScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                      child: Image.asset(
                    'assets/images/playstore.png',
                    fit: BoxFit.cover,
                    width: 80.0,
                    height: 80.0,
                  )),
                  Lottie.asset('assets/lottie_files/chat_bot_loading.json',
                      width: 75.0, height: 75.0, fit: BoxFit.cover),
                ],
              ),
            ),
            Positioned(
              bottom: 80,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  const Text('From', style: TextStyle(fontFamily: 'Poppins-bold', color: purple900, fontSize: 12),),
                  RowText(
                    onTap: () {},
                    title1: 'i\'naM',
                    title1Style: const TextStyle(
                      fontFamily: 'Poppins-bold',
                      color: purple900,
                      fontSize: 16
                    ),
                  ),
                ],
              ),
            ),
            const Align(alignment: Alignment.bottomCenter, child: Footer()),
          ],
        ),
      ),
    );
  }
}
