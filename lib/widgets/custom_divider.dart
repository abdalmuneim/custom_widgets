import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.isHor = true,
    this.height,
    this.width,
    this.color,
    this.margin,
  });
  final EdgeInsetsGeometry? margin;
  final bool? isHor;
  final double? height;
  final double? width;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return isHor!
        ? Container(
            margin: margin ?? const EdgeInsets.symmetric(horizontal: 6),
            width: width ?? 100,
            height: .5,
            color: color ?? const Color(0xFF797979),
          )
        : Container(
            margin: margin ?? const EdgeInsets.symmetric(horizontal: 4),
            width: .5,
            height: height ?? 100,
            color: color ?? const Color(0xFF797979),
          );
  }
}
