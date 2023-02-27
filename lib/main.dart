import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_chat/src/presentation/cubiT/my_cubit_observer.dart';
import 'app.dart';
import 'injections/injection_container.dart' as di;

void main() async {
  Bloc.observer = MyCubitObserver();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();

  /// ----- iChat -----
  runApp(const MyApp());

}

