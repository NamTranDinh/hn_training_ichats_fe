import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../theme/app_color.dart';

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
        Positioned(
          top: 50,
          left: 20,
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const Text(
                'Email Verification',
                style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                titleApp ?? 'Get Your OTP',
                style: const TextStyle(
                    color: purple900,
                    fontFamily: 'Poppins-Bold',
                    fontSize: 28,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                "Please enter the 4 digit code that sent to your email address!".toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: 'Poppins-Medium',
                    fontSize: 14,
                    color: Colors.deepPurple),
              )
            ],
          ),
        ),
      ],
    );
  }
}
