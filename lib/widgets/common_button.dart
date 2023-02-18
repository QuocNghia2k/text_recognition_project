import '../resources/resources.dart';
import 'inkwell_wrapper.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final void Function()? onTap;
  final Widget content;
  final Color buttonColor;
  final Color borderColor;
  final EdgeInsetsGeometry? paddingChild;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry padding;

  CommonButton({
    Key? key,
    required this.content,
    required this.onTap,
    this.buttonColor = AppColors.primaryBlack,
    this.borderColor = AppColors.primaryBlack,
    this.height,
    this.width,
    this.paddingChild,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: InkWellWrapper(
        onTap: onTap,
        color: buttonColor,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(border: Border.all(color: borderColor)),
          padding: paddingChild,
          child: content,
        ),
      ),
    );
  }
}