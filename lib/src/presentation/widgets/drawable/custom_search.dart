import 'package:flutter/material.dart';

class CustomSearch extends StatefulWidget {
  final VoidCallback onTap;
  final String? hintText;
  final IconData? prefixIcon;
  final Color? borderColor;
  final Color? backgroundColor;
  final double? borderSize;
  final double? radius;
  final StyleOutLineSearch styleOutLineEmail;
  final EdgeInsets? margin;
  final TextStyle? hintStyle;

  const CustomSearch({
    super.key,
    required this.styleOutLineEmail,
    this.prefixIcon,
    this.borderColor,
    this.backgroundColor,
    this.borderSize,
    this.margin,
    this.radius,
    this.hintText,
    this.hintStyle,
    required this.onTap,
  });

  @override
  State<CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
          margin: widget.margin,
          height: 36,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            border: Border.all(
                color: widget.borderColor ?? Colors.transparent,
                width: widget.borderSize ?? 1),
            borderRadius: BorderRadius.circular(widget.radius ?? 0),
            color: widget.backgroundColor ?? Colors.blue,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(right: 12, left: 3),
                  child: Icon(
                    widget.prefixIcon,
                    color: Colors.grey.shade700,
                  )),
              Text(widget.hintText ?? 'Search something' , style: widget.hintStyle ?? TextStyle(color: Colors.grey.shade700)),
            ],
          )),
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

enum StyleOutLineSearch { outlineInputBorder, underlineInputBorder }
