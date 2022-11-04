import 'package:flutter/material.dart';
import 'package:i_chat/src/config/app_const.dart';
import 'package:i_chat/src/presentation/screens/auth_screens/forget_password_screen.dart';
import 'package:i_chat/src/presentation/screens/auth_screens/reset_password_screen.dart';
import 'package:i_chat/src/presentation/screens/auth_screens/sign_in_screen.dart';
import 'package:i_chat/src/presentation/screens/auth_screens/welcome_screen.dart';
import 'package:i_chat/src/presentation/screens/iChats_screens/iChats_screen.dart';
import '../presentation/screens/auth_screens/error_screen.dart';
import '../presentation/screens/auth_screens/otp_screen.dart';
import '../presentation/screens/auth_screens/sign_up_screen.dart';

class OnGenerateRoute {
  static Route<dynamic> route(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    final namesRoutes = routeSettings.name;
    switch (namesRoutes) {
      case RouteConst.welcomeRoute:
        {
          return _toPageRoute(route: const WelcomeScreen());
        }
      case RouteConst.signInRoute:
        {
          return _toPageRoute(route: const SignInScreen());
        }
      case RouteConst.signupRoute:
        {
          return _toPageRoute(route: const SignUpScreen());
        }
      case RouteConst.forgotPassRoute:
        {
          return _toPageRoute(route: const ForgetPasswordScreen());
        }
      case RouteConst.getOtpRoute:
        {
          return _toPageRoute(route: const OtpScreen());
        }
      case RouteConst.resetPasswordRoute:
        {
          return _toPageRoute(route: const ResetPasswordScreen());
        }
      case RouteConst.iChatsRoutes:
        {
          return _toPageRoute(route: const IChatsScreen());
        }
      default:
        return _toPageRoute(route: const ErrorScreen());
    }
  }
}

MaterialPageRoute _toPageRoute({required Widget route}) {
  return MaterialPageRoute(
    builder: (_) => route,
  );
}
