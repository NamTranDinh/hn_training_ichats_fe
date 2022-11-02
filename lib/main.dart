import 'package:flutter/material.dart';
import 'package:i_chat/src/presentation/pages/welcome_page.dart';
import 'package:i_chat/src/route/on_generate_route.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MaterialApp(
    title: 'IChats',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Colors.purple[800]),
    initialRoute: OnGenerateRoute.forgetPassRoute,
    onGenerateRoute: OnGenerateRoute.route,
    // routes: {
    //   OnGenerateRoute.welcomeRoute: (context) {
    //     return const WelcomePage();
    //   }
    // },
  ));
}

