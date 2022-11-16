import 'package:flutter/material.dart';
import 'package:i_chat/src/config/app_const.dart';
import 'package:i_chat/src/presentation/screens/auth_screens/forget_password_screen.dart';
import 'package:i_chat/src/presentation/screens/auth_screens/reset_password_screen.dart';
import 'package:i_chat/src/presentation/screens/auth_screens/sign_in_screen.dart';
import 'package:i_chat/src/presentation/screens/auth_screens/welcome_screen.dart';
import 'package:i_chat/src/presentation/screens/iChats_screens/add_member_to_group_screen.dart';
import 'package:i_chat/src/presentation/screens/iChats_screens/iChats_screen.dart';
import 'package:i_chat/src/presentation/screens/iChats_screens/user_chat_screen.dart';
import '../presentation/screens/auth_screens/error_screen.dart';
import '../presentation/screens/auth_screens/otp_screen.dart';
import '../presentation/screens/auth_screens/sign_up_screen.dart';
import '../presentation/screens/iChats_screens/create_group_screen.dart';
import '../presentation/screens/iChats_screens/search_screen.dart';

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
          if (args is String) {
            return _toPageRoute(route: OtpScreen(email: args));
          } else {
            return _toPageRoute(
                route: const ErrorScreen(
              msg: 'Sent otp failure!!',
            ));
          }
        }
      case RouteConst.resetPasswordRoute:
        {
          return _toPageRoute(route: const ResetPasswordScreen());
        }
      case RouteConst.iChatsRoutes:
        {
          return _toPageRoute(route: const IChatsScreen());
        }
      case RouteConst.searchRoutes:
        {
          return _toPageRoute(route: const SearchScreen());
        }
      case RouteConst.userChatRoutes:
        {
          return _toPageRoute(route: const UserChatScreen());
        }
      case RouteConst.addMemberToGroupRoutes:
        {
          return _toPageRoute(route: const AddMemberToGroupScreen());
        }
      case RouteConst.createGroupScreen:
        {
          return _toPageRoute(route: const CreateGroupScreen());
        }
      default:
        return _toPageRoute(route: const ErrorScreen(msg: 'Wrong page!'));
    }
  }
}

MaterialPageRoute _toPageRoute({required Widget route}) {
  return MaterialPageRoute(
    builder: (_) => route,
  );
}
