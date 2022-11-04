import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Made with ♥ by iChats developer',
      style: TextStyle(fontFamily: 'Poppins-Medium', fontSize: 10),);
  }
}
