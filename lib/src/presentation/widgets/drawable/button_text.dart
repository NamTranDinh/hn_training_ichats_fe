// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  final VoidCallback onPressed;
  Color? backgroundColor;
  Color? borderColor;
  double? borderSize;
  double? width;
  String text;
  double? height;
  double? radius;
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? margin;
  double? elevated;
  Alignment? textAlign;
  TextStyle? textStyle;
  bool isUppercase;

  ButtonText(
      {super.key,
      required this.onPressed,
      this.backgroundColor,
      this.width,
      this.text = 'Button',
      this.height,
      this.borderColor,
      this.borderSize,
      this.radius,
      this.margin,
      this.elevated,
      this.textAlign,
      this.textStyle,
      this.isUppercase = false,
      this.padding});

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return Container(
      width: width ?? widthScreen * 0.6,
      height: height ?? widthScreen * 0.12,
      margin: margin,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            alignment: textAlign ?? Alignment.center,
            elevation: elevated ?? 3,
            backgroundColor: backgroundColor ?? Colors.blue,
            side: BorderSide(
              width: borderSize ?? 0,
              color: borderColor ?? Colors.blue,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius ?? 3)),
          ),
          onPressed: onPressed,
          child: Text(
            isUppercase ? text.toUpperCase().trim() : text.trim(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textStyle ??
                const TextStyle(
                  color: Colors.white,
                ),
          )),
    );
  }
}
