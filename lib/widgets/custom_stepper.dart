import 'package:custom_widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

class CustomStepper extends StatelessWidget {
  final int currentStep;
  final double? size;
  final EdgeInsetsGeometry? padding;
  final List<Widget> steps;
  final List<Widget>? stepsDetails;
  final Axis? direction;
  final Color? notActiveColor, activeColor;
  final bool? enableLine;
  final bool? shrinkWrap;
  final String? labelText;
  final double? labelTextSize;
  final TextAlign? labelAlign;
  final Color? lableColor;
  const CustomStepper({
    super.key,
    required this.currentStep,
    this.padding,
    this.labelAlign,
    this.labelTextSize,
    this.lableColor,
    this.labelText,
    this.size,
    required this.steps,
    this.stepsDetails,
    this.direction,
    this.enableLine,
    this.notActiveColor,
    this.activeColor,
    this.shrinkWrap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (labelText != null) ...[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: CustomText(
              textAlign: labelAlign,
              fontSize: labelTextSize ?? 16,
              text: labelText!,
              color: lableColor,
            ),
          ),
          2.sh,
        ],
        Expanded(
          child: ListView.builder(
            shrinkWrap: shrinkWrap ?? true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: direction ?? Axis.horizontal,
            itemCount: steps.length,
            itemBuilder: (context, index) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        width: size,
                        height: size,
                        alignment: Alignment.center,
                        padding: padding ??
                            const EdgeInsets.symmetric(
                                horizontal: 2.8, vertical: 2.8),
                        decoration: BoxDecoration(
                            color: currentStep >= index
                                ? activeColor
                                : notActiveColor,
                            shape: BoxShape.circle),
                        child: Center(child: steps[index])),
                    if (enableLine ?? true) ...[
                      if (steps.length - 1 != index)
                        SizedBox(
                          width: steps.length + 20,
                          child: Divider(
                            thickness: 6,
                            color: currentStep - 1 >= index
                                ? activeColor
                                : notActiveColor,
                          ),
                        ),
                    ] else ...[
                      (steps.length + 15).sw,
                    ]
                  ],
                ),
                if (stepsDetails != null) ...[
                  stepsDetails![index],
                ]
              ],
            ),
          ),
        ),
      ],
    );
  }
}
