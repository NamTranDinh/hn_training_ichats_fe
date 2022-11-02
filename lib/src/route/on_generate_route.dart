import 'package:flutter/material.dart';
import 'package:i_chat/src/config/app_const.dart';
import 'package:i_chat/src/presentation/pages/auth_pages/forget_password_page.dart';
import 'package:i_chat/src/presentation/pages/auth_pages/reset_password_page.dart';
import 'package:i_chat/src/presentation/pages/auth_pages/sign_in_page.dart';
import 'package:i_chat/src/presentation/pages/auth_pages/welcome_page.dart';
import '../presentation/pages/auth_pages/error_page.dart';
import '../presentation/pages/auth_pages/otp_page.dart';
import '../presentation/pages/auth_pages/sign_up_page.dart';

class OnGenerateRoute {
  static Route<dynamic> route(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    final namesRoutes = routeSettings.name;
    switch (namesRoutes) {
      case RouteConst.welcomeRoute:
        {
          return _toPageRoute(route: const WelcomePage());
        }
      case RouteConst.signInRoute:
        {
          return _toPageRoute(route: const SignInPage());
        }
      case RouteConst.signupRoute:
        {
          return _toPageRoute(route: const SignUpPage());
        }
      case RouteConst.forgotPassRoute:
        {
          return _toPageRoute(route: const ForgetPasswordPage());
        }
      case RouteConst.getOtpRoute:
        {
          return _toPageRoute(route: const OtpPage());
        }
      case RouteConst.resetPasswordRoute:
        {
          return _toPageRoute(route: const ResetPasswordPage());
        }
      default:
        return _toPageRoute(route: const ErrorPage());
    }
  }
}

MaterialPageRoute _toPageRoute({required Widget route}) {
  return MaterialPageRoute(
    builder: (_) => route,
  );
}
