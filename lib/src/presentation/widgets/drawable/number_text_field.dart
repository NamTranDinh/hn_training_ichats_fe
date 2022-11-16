import 'package:flutter/material.dart';

class NumberTextField extends StatefulWidget {
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
    this.autoValidateMode,
    this.textInputAction,
    required this.controller,
  });

  @override
  State<NumberTextField> createState() => _NumberTextFieldState();
}

class _NumberTextFieldState extends State<NumberTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 60,
      height: 60,
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: widget.controller,
        maxLength: 1,
        maxLines: 1,
        textInputAction: widget.textInputAction,
        textAlign: TextAlign.center,
        obscureText: false,
        cursorColor: widget.borderColor ?? Colors.blue,
        focusNode: widget.focusNote,
        style: widget.textStyle ??
            const TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        keyboardType: TextInputType.number,
        onChanged: widget.onChanged,
        validator: widget.validator,
        autovalidateMode: widget.autoValidateMode ?? AutovalidateMode.disabled,
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: Colors.white,
          enabledBorder:
              (widget.styleOutLineOtp == StyleOutLineOTP.outlineInputBorder)
                  ? outLineInputBorder(widget.borderColor)
                  : underLineInputBorder(),
          focusedBorder:
              (widget.styleOutLineOtp == StyleOutLineOTP.outlineInputBorder)
                  ? outLineInputBorder(widget.borderColor)
                  : underLineInputBorder(),
          errorBorder:
              (widget.styleOutLineOtp == StyleOutLineOTP.outlineInputBorder)
                  ? outLineInputBorder(Colors.red)
                  : underLineInputBorder(),
          focusedErrorBorder:
              (widget.styleOutLineOtp == StyleOutLineOTP.outlineInputBorder)
                  ? outLineInputBorder(Colors.red)
                  : underLineInputBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder outLineInputBorder(Color? borderColor) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(widget.radius ?? 6.0),
      ),
      borderSide: BorderSide(
        width: widget.borderSize ?? 1.0,
        color: borderColor ?? Colors.transparent,
      ),
    );
  }

  UnderlineInputBorder underLineInputBorder() {
    return UnderlineInputBorder(
        borderSide: BorderSide(
      width: widget.borderSize ?? 3,
      color: widget.borderColor ?? Colors.blue.shade600,
    ));
  }
}

enum StyleOutLineOTP { outlineInputBorder, underlineInputBorder }
