import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_chat/injections/injection_container.dart';
import 'package:i_chat/src/presentation/cubiT/auth/auth_cubit.dart';
import 'package:i_chat/src/presentation/cubiT/credential/credential_cubit.dart';

import 'src/config/app_const.dart';
import 'src/route/on_generate_route.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (_) => instance<AuthCubit>()..initApp()),
        BlocProvider<CredentialCubit>(create: (_) => instance<CredentialCubit>()),
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
