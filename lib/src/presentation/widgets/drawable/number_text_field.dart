import 'package:flutter/material.dart';

class NumberTextField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  late TextEditingController controller;
  final FormFieldValidator<String> validator;
  final AutovalidateMode? autoValidateMode;
  final StyleOutLineOTP? styleOutLineOtp;
  final TextInputAction? textInputAction;
  final Color? borderColor;
  final double? borderSize;
  final double? radius;
  final FocusNode? focusNote;
  final TextStyle? textStyle;

  NumberTextField({
    super.key,
    this.styleOutLineOtp,
    this.borderColor,
    this.borderSize,
    this.focusNote,
    this.radius,
    this.textStyle,
    required this.onChanged,
    required this.validator,
    this.autoValidateMode, this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 60,
      height: 60,
      margin: const EdgeInsets.all(8),
      child: Center(
        child: TextFormField(
          maxLength: 1,
          maxLines: 1,
          textInputAction: textInputAction,
          textAlign: TextAlign.center,
          obscureText: false,
          cursorColor: borderColor ?? Colors.blue,
          focusNode: focusNote,
          style: textStyle ??
              const TextStyle(
                  color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          onChanged: onChanged,
          validator: validator,
          autovalidateMode: autoValidateMode ?? AutovalidateMode.disabled,
          decoration: InputDecoration(
            counterText: '',
            filled: true,
            fillColor: Colors.white,
            enabledBorder:
                (styleOutLineOtp == StyleOutLineOTP.outlineInputBorder)
                    ? outLineInputBorder(borderColor)
                    : underLineInputBorder(),
            focusedBorder:
                (styleOutLineOtp == StyleOutLineOTP.outlineInputBorder)
                    ? outLineInputBorder(borderColor)
                    : underLineInputBorder(),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder outLineInputBorder(Color? borderColor) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(radius ?? 6.0),
      ),
      borderSide: BorderSide(
        width: borderSize ?? 1.0,
        color: borderColor ?? Colors.transparent,
      ),
    );
  }

  UnderlineInputBorder underLineInputBorder() {
    return UnderlineInputBorder(
        borderSide: BorderSide(
      width: borderSize ?? 3,
      color: borderColor ?? Colors.blue.shade600,
    ));
  }
}

enum StyleOutLineOTP { outlineInputBorder, underlineInputBorder }
