import 'package:flutter/material.dart';
import 'package:i_chat/src/presentation/pages/forget_password_page.dart';
import 'package:i_chat/src/presentation/pages/sign_in_page.dart';
import 'package:i_chat/src/presentation/pages/sign_up_page.dart';
import 'package:i_chat/src/presentation/pages/welcome_page.dart';

import '../presentation/pages/error_page.dart';

class OnGenerateRoute {

  static const String welcomeRoute = '/welcome';
  static const String signRoute = '/sign_in';
  static const String signupRoute = '/sign_up';
  static const String forgetPassRoute = '/forget_pass';

  static Route<dynamic> route(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    final namesRoutes = routeSettings.name;
    switch(namesRoutes){
      case welcomeRoute:{
        return toPageRoute(route: const WelcomePage());
      }
      case signRoute:{
        return toPageRoute(route: const SignInPage());
      }
      case signupRoute:{
        return toPageRoute(route: const SignUpPage());
      }
      case forgetPassRoute:{
        return toPageRoute(route: const ForgetPasswordPage());
      }
      default : return toPageRoute(route: const ErrorPage());
    }
  }
}

MaterialPageRoute toPageRoute({required Widget route}){
  return MaterialPageRoute(builder: (_) => route,);
}