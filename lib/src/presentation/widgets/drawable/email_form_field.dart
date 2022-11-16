import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EmailFormField extends StatefulWidget {
  late TextEditingController controller;
  final ValueChanged<String> onChanged;
  final FormFieldValidator<String> validator;
  final AutovalidateMode? autoValidateMode;
  final TextInputAction? textInputAction;
  final String? initValue;
  final String? helperText;
  final String? labelText;
  final String? hintText;
  final FocusNode? nextFocusNote;
  final FocusNode? focusNote;
  final IconData? prefixIcon;
  final Color? borderColor;
  final Color? backgroundColor;
  final double? borderSize;
  final double? radius;
  final StyleOutLineEmail styleOutLineEmail;
  final EdgeInsets? margin;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;

  EmailFormField({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.validator,
    required this.styleOutLineEmail,
    this.autoValidateMode,
    this.initValue,
    this.nextFocusNote,
    this.textInputAction,
    this.focusNote,
    this.prefixIcon,
    this.borderColor,
    this.backgroundColor,
    this.borderSize,
    this.margin,
    this.radius,
    this.labelText,
    this.hintText,
    this.labelStyle,
    this.hintStyle,
    this.helperText,
  });

  @override
  State<EmailFormField> createState() => _EmailFormFieldState();
}

class _EmailFormFieldState extends State<EmailFormField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextFormField(
        controller: widget.controller,
        autovalidateMode: widget.autoValidateMode ?? AutovalidateMode.disabled,
        validator: widget.validator,
        onChanged: widget.onChanged,
        initialValue: widget.initValue,
        focusNode: widget.focusNote,
        textInputAction: widget.textInputAction,
        onFieldSubmitted: (_) => widget.nextFocusNote?.requestFocus(),
        keyboardType: TextInputType.emailAddress,
        cursorColor: widget.borderColor ?? Colors.blue,
        maxLines: 1,
        obscureText: false,
        cursorHeight: 24,
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.backgroundColor ?? Colors.white,
          labelText: widget.labelText ?? 'Email',
          hintText: widget.hintText ?? 'example@email.com',
          labelStyle: widget.labelStyle ?? TextStyle(color: widget.borderColor),
          hintStyle: widget.hintStyle,
          helperText: widget.helperText ?? '',
          prefixIcon: Icon(
            widget.prefixIcon ?? Icons.person,
            color: widget.borderColor ?? Colors.blue,
            size: 24,
          ),
          suffixIcon: GestureDetector(
              onTap: () {
                widget.controller.clear();
              },
              child: Icon(
                Icons.close,
                color: widget.borderColor ?? Colors.blue,
              )),
          errorStyle: const TextStyle(color: Colors.red),
          enabledBorder:
              (widget.styleOutLineEmail == StyleOutLineEmail.outlineInputBorder)
                  ? outLineInputBorder(widget.borderColor)
                  : underLineInputBorder(),
          focusedBorder:
              (widget.styleOutLineEmail == StyleOutLineEmail.outlineInputBorder)
                  ? outLineInputBorder(widget.borderColor)
                  : underLineInputBorder(),
          errorBorder:
              (widget.styleOutLineEmail == StyleOutLineEmail.outlineInputBorder)
                  ? outLineInputBorder(Colors.red)
                  : underLineInputBorder(),
          focusedErrorBorder:
              (widget.styleOutLineEmail == StyleOutLineEmail.outlineInputBorder)
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
        color: borderColor ?? Colors.blue,
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

enum StyleOutLineEmail { outlineInputBorder, underlineInputBorder }
