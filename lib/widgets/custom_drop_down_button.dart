import 'package:custom_widgets_2/custom_widgets.dart';
import 'package:flutter/material.dart';

class CustomDropDownButton<T> extends StatelessWidget {
  const CustomDropDownButton({
    super.key,
    this.items,
    this.onChanged,
    this.width,
    this.height,
    this.newValue,
    this.hintText,
    this.validator,
    this.labelText,
    this.contentPadding,
    this.textAlign,
    this.labelAlign,
    this.fillColor,
    this.onTap,
    this.labelColor,
    this.inputBorder,
    this.disabledBorder,
    this.enabledBorder,
    this.iconColor,
    this.borderColor,
    this.dropdownColor,
    this.itemColor,
    this.borderRadius,
    this.icon,
    this.radius,
    this.hintStyle,
  });
  final List<T>? items;
  final void Function(T?)? onChanged;
  final double? width, height;

  final T? newValue;
  final String? hintText, labelText;
  final TextStyle? hintStyle;
  final String? Function(T?)? validator;
  final EdgeInsetsGeometry? contentPadding;
  final TextAlign? textAlign, labelAlign;
  final void Function()? onTap;
  final Color? labelColor,
      fillColor,
      iconColor,
      borderColor,
      dropdownColor,
      itemColor;
  final InputBorder? inputBorder, enabledBorder, disabledBorder;
  final Widget? icon;
  final BorderRadius? borderRadius;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (labelText != null) ...[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: CustomText(
              textAlign: labelAlign,
              text: labelText!,
              color: labelColor,
            ),
          ),
          2.sh,
        ],
        DropdownButtonFormField<T>(
          validator: validator,
          icon: icon ??
              Icon(
                Icons.arrow_drop_down,
                color: iconColor,
              ),
          value: newValue,
          dropdownColor: dropdownColor ?? Theme.of(context).cardTheme.color,
          items: items
              ?.map(
                (e) => DropdownMenuItem<T>(
                  value: e,
                  child: CustomText(
                    text: e.toString(),
                    fontSize: 13,
                    color: itemColor ?? const Color(0xFFeeeeee),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              )
              .toList(),
          onChanged: onChanged,
          isDense: true,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(),
          decoration: InputDecoration(
            contentPadding:
                contentPadding ?? const EdgeInsets.symmetric(horizontal: 10),
            hintText: hintText,
            hintStyle: hintStyle,
            fillColor: fillColor,
            filled: true,
            enabledBorder: enabledBorder ??
                Theme.of(context)
                    .dropdownMenuTheme
                    .inputDecorationTheme
                    ?.enabledBorder,
            disabledBorder: disabledBorder ??
                Theme.of(context).inputDecorationTheme.disabledBorder,
            border: inputBorder ??
                Theme.of(context)
                    .dropdownMenuTheme
                    .inputDecorationTheme
                    ?.border,
          ),
        ),
      ],
    );
  }
}
