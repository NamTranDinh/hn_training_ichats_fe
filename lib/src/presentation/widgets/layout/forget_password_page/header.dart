import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../theme/app_color.dart';

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
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SvgPicture.asset(
          'assets/images/background.svg',
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fitWidth,
        ),
        
        Column(
          children: [
            Text(
              titleApp??'Mail Address Here',
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
              "Enter email address associated with you account!".toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: 'Poppins-Medium',
                  fontSize: 14,
                  color: Colors.deepPurple),
            )
          ],
        ),
      ],
    );
  }
}
