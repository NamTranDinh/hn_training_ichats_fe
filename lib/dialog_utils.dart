import 'package:flutter/material.dart';
import 'package:i_chat/src/config/theme/app_color.dart';
import 'package:i_chat/src/presentation/widgets/drawable/button_text.dart';

class DialogUtils {
  static void showDialogConfirm(
      {required BuildContext context,
      required String title,
      required VoidCallback onCancel,
      required VoidCallback onConfirm}) {
    showDialog(
      context: context,
      builder: (context) => LogoutOverlay(
        onCancel: onCancel,
        onConfirm: onConfirm,
        title: title,
      ),
    );
  }
}

class LogoutOverlay extends StatefulWidget {
  final String title;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  const LogoutOverlay(
      {super.key,
      required this.onCancel,
      required this.onConfirm,
      required this.title});

  @override
  State<StatefulWidget> createState() => LogoutOverlayState();
}

class LogoutOverlayState extends State<LogoutOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.all(20.0),
              height: 260.0,
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16.0),
                    child: const Icon(
                      Icons.logout,
                      size: 36,
                      color: purple900,
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Text(
                        widget.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Poppins-medium',
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ButtonText(
                            radius: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            backgroundColor: Colors.white,
                            borderSize: 1,
                            borderColor: purple900,
                            width: 100,
                            textStyle: const TextStyle(color: purple900),
                            text: 'OK',
                            onPressed: widget.onConfirm,
                          ),
                          ButtonText(
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            radius: 50,
                            backgroundColor: Colors.red,
                            width: 100,
                            textStyle: const TextStyle(color: Colors.white),
                            text: 'Cancel',
                            onPressed: widget.onCancel,
                          ),
                        ],
                      ))
                ],
              )),
        ),
      ),
    );
  }
}
