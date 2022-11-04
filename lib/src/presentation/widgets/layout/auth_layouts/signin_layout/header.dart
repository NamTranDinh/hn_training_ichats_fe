import 'package:flutter/material.dart';
import '../../../../../config/theme/app_color.dart';

class Header extends StatelessWidget {
  final String? titleApp;
  final String? srcLogo;

  const Header({
    super.key,
    this.titleApp,
    this.srcLogo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Image.asset(
            srcLogo??
            'assets/images/playstore.png',
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.035,
        ),
        Text(
          titleApp??'iChats',
          style: const TextStyle(
              color: purple900,
              fontFamily: 'Poppins-Bold',
              fontSize: 28
              ,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        Text(
          "World's most private chatting app".toUpperCase(),
          style: const TextStyle(
              fontFamily: 'Poppins-Medium',
              fontSize: 12,
              color: Colors.deepPurple),
        ),
      ],
    );
  }
}
