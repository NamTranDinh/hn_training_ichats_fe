import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_chat/src/config/app_const.dart';
import 'package:i_chat/src/presentation/manager/auth/auth_cubit.dart';
import 'package:i_chat/src/presentation/manager/credential/credential_cubit.dart';
import 'package:i_chat/src/route/on_generate_route.dart';
import 'injections/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => di.instance<AuthCubit>()..appStarted(),
        ),
        BlocProvider(
          create: (_) => di.instance<CredentialCubit>(),
        )
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
