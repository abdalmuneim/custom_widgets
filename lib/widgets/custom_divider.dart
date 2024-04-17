import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.isHor = true,
    this.height,
    this.width,
    this.color,
    this.margin,
    this.thickness = .8,
  });
  final EdgeInsetsGeometry? margin;
  final bool? isHor;
  final double? height;
  final double? width, thickness;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return isHor!
        ? Container(
            margin: margin,
            width: width ?? MediaQuery.of(context).size.width,
            height: thickness,
            color: color ?? const Color(0xFF797979),
          )
        : Container(
            margin: margin,
            width: thickness,
            height: height ?? MediaQuery.of(context).size.width,
            color: color ?? const Color(0xFF797979),
          );
  }
}
