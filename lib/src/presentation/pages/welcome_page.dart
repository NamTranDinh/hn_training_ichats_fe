import 'dart:async';

import 'package:flutter/material.dart';
import 'package:i_chat/src/presentation/pages/sign_in_page.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  void initState(){
    super.initState();
    Timer(
        const Duration(milliseconds: 3900),
            () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const SignInPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(
              'assets/images/playstore.png',
              fit: BoxFit.cover,
              width: 120.0,
              height: 120.0,
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
