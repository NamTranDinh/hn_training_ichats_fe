import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  late TextEditingController controller;
  final FormFieldValidator<String> validator;
  final AutovalidateMode? autoValidateMode;
  final TextInputAction? textInputAction;
  final String? initValue;
  final String? helperText;
  final String? labelText;
  final FocusNode? nextFocusNote;
  final FocusNode? focusNote;
  final IconData? prefixIcon;
  final Color? borderColor;
  final double? borderSize;
  final Color? backgroundColor;
  final double? radius;
  final StyleOutLinePass styleOutLinePass;
  final EdgeInsets? margin;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  late bool obscurityText;

  PasswordFormField({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.validator,
    required this.styleOutLinePass,
    this.autoValidateMode,
    this.textInputAction,
    this.initValue,
    this.nextFocusNote,
    this.focusNote,
    this.prefixIcon,
    this.borderColor,
    this.backgroundColor,
    this.borderSize,
    this.radius,
    this.margin,
    this.labelStyle,
    this.hintStyle,
    this.helperText,
    this.labelText,
    this.obscurityText = true,
  });

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        autovalidateMode: widget.autoValidateMode ?? AutovalidateMode.disabled,
        maxLines: 1,
        maxLength: 20,
        textInputAction: widget.textInputAction,
        obscureText: widget.obscurityText,
        onChanged: widget.onChanged,
        initialValue: widget.initValue,
        focusNode: widget.focusNote,
        onFieldSubmitted: (_) => widget.nextFocusNote?.requestFocus(),
        keyboardType: TextInputType.emailAddress,
        cursorColor: widget.borderColor??Colors.blue,
        cursorHeight: 24,
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.backgroundColor ?? Colors.white,
          labelText: widget.labelText ?? 'Password',
          helperText: widget.helperText ?? '',
          labelStyle: widget.labelStyle ?? TextStyle(color: widget.borderColor),
          hintStyle: widget.hintStyle,
          prefixIcon: Icon(widget.prefixIcon ?? Icons.password,
              color: widget.borderColor ?? Colors.blue, size: 24),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                widget.obscurityText = !widget.obscurityText;
              });
            },
            child: widget.obscurityText
                ? Icon(Icons.visibility_off,
                    color: widget.borderColor ?? Colors.blue, size: 24)
                : Icon(Icons.visibility,
                    color: widget.borderColor ?? Colors.blue, size: 24),
          ),
          enabledBorder:
              (widget.styleOutLinePass == StyleOutLinePass.outlineInputBorder)
                  ? outLineInputBorder(widget.borderColor)
                  : underLineInputBorder(),
          focusedBorder:
              (widget.styleOutLinePass == StyleOutLinePass.outlineInputBorder)
                  ? outLineInputBorder(widget.borderColor)
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
      width: widget.borderSize ?? 2,
      color: widget.borderColor ?? Colors.blue.shade600,
    ));
  }
}

enum StyleOutLinePass { outlineInputBorder, underlineInputBorder }
