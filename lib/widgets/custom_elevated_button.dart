import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.onPressed,
    this.color,
    this.radius,
    required this.child,
    this.side,
    this.maximumSize,
    this.minimumSize,
    this.isCircle,
    this.elevation,
    this.padding,
    this.borderRadius,
    this.label,
  });
  final void Function()? onPressed;
  final Color? color;
  final double? radius;
  final BorderSide? side;
  final Size? maximumSize, minimumSize;
  final bool? isCircle;
  final String? label;
  final double? elevation;
  final Widget child;
  final EdgeInsets? padding;
  final BorderRadiusGeometry? borderRadius;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            padding: MaterialStateProperty.all(padding),
            elevation: MaterialStateProperty.all(elevation),
            maximumSize: MaterialStateProperty.all(maximumSize),
            minimumSize: MaterialStateProperty.all(minimumSize),
            backgroundColor: MaterialStateProperty.all(
              color,
            ),
            shape: isCircle ?? false
                ? MaterialStateProperty.all<CircleBorder>(
                    CircleBorder(side: side ?? BorderSide.none),
                  )
                : MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: borderRadius ??
                            BorderRadius.circular(radius ?? 100),
                        side: side ?? BorderSide.none),
                  ),
          ),
      onPressed: onPressed,
      child: child,
    );
  }
}
