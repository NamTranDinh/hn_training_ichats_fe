import 'package:flutter/material.dart';

import '../theme/app_color.dart';

class RowText extends StatelessWidget {
  final VoidCallback onTap;
  final String title1;
  final String? title2;
  final String? title3;
  final String? title4;
  final String? title5;

  final TextStyle? title1Style;
  final TextStyle? title2Style;
  final TextStyle? title3Style;
  final TextStyle? title4Style;
  final TextStyle? title5Style;

  const RowText({
    super.key,
    required this.onTap,
    required this.title1,
    this.title2,
    this.title3,
    this.title4,
    this.title5,
    this.title1Style,
    this.title2Style,
    this.title3Style,
    this.title4Style,
    this.title5Style,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title1??'',
              style: title1Style ??
                  const TextStyle(
                      fontFamily: 'Poppins-Bold',
                      fontSize: 12,
                      color: purple500),
            ),
            Text(
              title2??'',
              style: title2Style ??
                  const TextStyle(
                      fontFamily: 'Poppins-Bold',
                      fontSize: 12,
                      color: purple500),
            ),
            Text(
              title3??'',
              style: title3Style ??
                  const TextStyle(
                      fontFamily: 'Poppins-Bold',
                      fontSize: 12,
                      color: purple500),
            ),
            Text(
              title4??'',
              style: title4Style ??
                  const TextStyle(
                      fontFamily: 'Poppins-Bold',
                      fontSize: 12,
                      color: purple500),
            ),
            Text(
              title5??'',
              style: title5Style ??
                  const TextStyle(
                      fontFamily: 'Poppins-Bold',
                      fontSize: 12,
                      color: purple500),
            ),
          ],
        ));
  }
}
