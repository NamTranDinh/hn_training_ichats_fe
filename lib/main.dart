import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:i_chat/app.dart';
import 'package:i_chat/src/presentation/cubiT/my_cubit_observer.dart';
import 'package:i_chat/src/presentation/widgets/drawable/button_text.dart';
import 'injections/injection_container.dart' as di;

void main() async {
  Bloc.observer = MyCubitObserver();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();

  runApp(const MyApp());

  /// ----- test -----
  // runApp(const TestGet());
}

class TestGet extends StatefulWidget {
  const TestGet({Key? key}) : super(key: key);

  @override
  State<TestGet> createState() => _TestGetState();
}

class _TestGetState extends State<TestGet> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'test GET',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter - Snackbar Using Get'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ButtonText(
                margin: const EdgeInsets.symmetric(vertical: 4),
                onPressed: () {
                  Get.snackbar('Snack bar title', 'Snack bar content',
                      snackPosition: SnackPosition.BOTTOM);
                },
                text: 'Show snack bar',
              ),
              ButtonText(
                margin: const EdgeInsets.symmetric(vertical: 4),
                onPressed: () {
                  Get.defaultDialog(
                    title: 'Dialog title',
                    content: const Text('Dialog content'),
                  );
                },
                text: 'Show dialog',
              ),
              ButtonText(
                margin: const EdgeInsets.symmetric(vertical: 4),
                onPressed: () {
                  Get.bottomSheet(Container());
                },
                text: 'Show bottom sheet',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
