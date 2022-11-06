import 'dart:async';

import 'package:flutter/material.dart';
import 'package:i_chat/src/presentation/screens/auth_screens/sign_in_screen.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  void initState(){
    super.initState();
    Timer(
        const Duration(milliseconds: 3900),
            () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const SignInScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(
              'assets/images/playstore.png',
              fit: BoxFit.cover,
              width: 100.0,
              height: 100.0,
              )
            ),
            Lottie.asset('assets/lottie_files/chat_bot_loading.json',
                width: 80, height: 80, fit: BoxFit.cover),
          ],
        ),
      ),
    );
  }
}
