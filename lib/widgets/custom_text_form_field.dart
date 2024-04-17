import 'package:custom_widgets/widgets/custom_text.dart';
import 'package:custom_widgets/widgets/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.maxLines = 1,
    this.minLines = 1,
    this.labelText,
    this.prefixIcon,
    this.filled = true,
    this.radius = 100,
    this.obscureText,
    this.suffixIcon,
    this.prefixIconColor,
    this.suffixIconColor,
    this.controller,
    this.textDirection,
    this.validator,
    this.onChange,
    this.maxLength,
    this.counterText,
    this.onSave,
    this.enabled = true,
    this.textAlign = TextAlign.start,
    this.labelAlign = TextAlign.start,
    this.labelColor,
    this.isNumberOnly = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.autofocus,
    this.onFieldSubmitted,
    this.width,
    this.height,
    this.borderColor,
    this.contentPadding,
    this.focusNode,
    this.fillColor,
    this.onTap,
    this.obscuringCharacter = '*',
    this.autofillHints,
    this.isLabel = true,
    this.borderRadius,
    this.autovalidateMode,
    this.textColor,
    this.lable,
    this.labelTextSize,
    this.disabledBorder,
    this.enabledBorder,
    this.inputBorder,
  });
  final int? maxLines, minLines;
  final String? hintText, labelText;
  final Widget? prefixIcon, suffixIcon;
  final Color? prefixIconColor,
      borderColor,
      suffixIconColor,
      fillColor,
      labelColor,
      textColor;
  final bool? filled, obscureText, enabled;
  final bool isNumberOnly, isLabel;
  final TextAlign? textAlign, labelAlign;
  final double radius;
  final BorderRadius? borderRadius;
  final InputBorder? inputBorder, enabledBorder, disabledBorder;

  final TextEditingController? controller;
  final TextDirection? textDirection;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChange;
  final FormFieldSetter<String>? onSave;
  final int? maxLength;
  final double? width, height, labelTextSize;
  final String? counterText, obscuringCharacter;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputAction? textInputAction;
  final bool? autofocus;
  final Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final void Function()? onTap;
  final Iterable<String>? autofillHints;
  final AutovalidateMode? autovalidateMode;
  final String? lable;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool obsecureText = widget.obscureText ?? false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (widget.labelText != null) ...[
          SizedBox(
            width: 100,
            child: CustomText(
              textAlign: widget.labelAlign,
              fontSize: widget.labelTextSize ?? 12,
              text: widget.labelText!,
              color: widget.labelColor,
            ),
          ),
          2.sh,
        ],
        SizedBox(
          width: widget.width,
          height: widget.height,
          child: TextFormField(
            autofillHints: widget.autofillHints,
            onTap: widget.onTap,
            focusNode: widget.focusNode,
            autovalidateMode: widget.autovalidateMode,
            onFieldSubmitted: widget.onFieldSubmitted,
            textInputAction: widget.textInputAction,
            autofocus: widget.autofocus ?? false,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            enabled: widget.enabled,
            validator: widget.validator,
            controller: widget.controller,
            onChanged: widget.onChange,
            onSaved: widget.onSave,
            textDirection: widget.textDirection,
            obscureText: obsecureText,
            obscuringCharacter: widget.obscuringCharacter!,
            keyboardType: widget.isNumberOnly
                ? const TextInputType.numberWithOptions(decimal: true)
                : widget.keyboardType,
            inputFormatters: widget.isNumberOnly
                ? [
                    FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                  ]
                : null,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: widget.textColor, fontSize: 13),
            textAlign: widget.textAlign ?? TextAlign.start,
            maxLength: widget.maxLength,
            decoration: InputDecoration(
              label: widget.lable != null ? Text(widget.lable!) : null,
              counterText: widget.counterText,
              suffixIcon: widget.prefixIcon ?? toggleVisibility(),
              suffixIconColor: widget.suffixIconColor ??
                  Theme.of(context).inputDecorationTheme.suffixIconColor,
              prefixIcon: widget.suffixIcon,
              prefixIconColor: widget.prefixIconColor ??
                  Theme.of(context).inputDecorationTheme.prefixIconColor,
              contentPadding: widget.contentPadding ??
                  Theme.of(context).inputDecorationTheme.contentPadding,
              hintText: widget.hintText,
              filled: true,
              fillColor: widget.fillColor ??
                  Theme.of(context).inputDecorationTheme.fillColor,
              enabledBorder: widget.enabledBorder ??
                  Theme.of(context).inputDecorationTheme.enabledBorder,
              disabledBorder: widget.disabledBorder ??
                  Theme.of(context).inputDecorationTheme.enabledBorder,
              border: widget.inputBorder ??
                  Theme.of(context).inputDecorationTheme.border,
            ),
          ),
        ),
      ],
    );
  }

  toggleVisibility() {
    if (obsecureText) {
      return IconButton(
        icon: const Icon(
          Icons.visibility_off_outlined,
        ),
        onPressed: () {
          setState(() {
            obsecureText = false;
          });
        },
      );
    } else if (widget.obscureText != null) {
      return IconButton(
        icon: const Icon(
          Icons.visibility_outlined,
        ),
        onPressed: () {
          setState(() {
            obsecureText = true;
          });
        },
      );
    } else {
      return null;
    }
  }
}
