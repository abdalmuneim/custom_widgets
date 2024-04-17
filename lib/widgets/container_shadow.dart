import 'package:flutter/material.dart';

class ContainerShadow extends StatelessWidget {
  const ContainerShadow({
    super.key,
    this.width,
    this.height,
    required this.child,
    this.padding,
    this.margin,
    this.border = true,
    this.addShadow = true,
    this.borderRadius,
    this.color,
  });

  final double? width, height;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool? border, addShadow;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 10),
        margin: margin ?? const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          boxShadow: !addShadow!
              ? null
              : const [
                  BoxShadow(
                    color: Colors.black38,
                    offset: Offset(0.0, 5.0),
                    blurRadius: 6.0,
                    spreadRadius: 0.0,
                  ), //
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0, 0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ),
                ],
          color: color ?? Colors.white,
          borderRadius: borderRadius ?? BorderRadius.circular(25),
          border: border! ? Border.all(color: const Color(0xFFADADAD)) : null,
        ),
        child: child);
  }
}
