import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text('This is Error page', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),),
      ),
    );
  }
}
