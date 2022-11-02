import 'package:flutter/material.dart';
import 'package:i_chat/src/config/app_const.dart';
import 'package:i_chat/src/route/on_generate_route.dart';

void main() {
  runApp(MaterialApp(
    title: 'IChats',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Colors.purple[800]),
    initialRoute: RouteConst.welcomeRoute,
    onGenerateRoute: OnGenerateRoute.route,
    // routes: {
    //   OnGenerateRoute.welcomeRoute: (context) {
    //     return const WelcomePage();
    //   }
    // },
  ));
}

