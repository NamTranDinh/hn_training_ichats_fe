import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String msg;

  const ErrorScreen({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text(
          msg,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
