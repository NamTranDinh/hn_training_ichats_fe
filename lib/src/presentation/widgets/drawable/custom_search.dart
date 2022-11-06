import 'package:flutter/material.dart';

class CustomSearch extends StatefulWidget {
  final VoidCallback onTap;
  final String? hintText;
  final IconData? prefixIcon;
  final Color? borderColor;
  final Color? backgroundColor;
  final double? borderSize;
  final double? radius;
  final EdgeInsets? margin;
  final TextStyle? hintStyle;

  const CustomSearch({
    super.key,
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
              Text(widget.hintText ?? 'Search something',
                  style: widget.hintStyle ??
                      TextStyle(color: Colors.grey.shade700)),
            ],
          )),
    );
  }
}
