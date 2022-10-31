import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

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
