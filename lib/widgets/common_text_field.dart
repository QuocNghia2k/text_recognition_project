import '../enums.dart';

import '../validator/validator.dart';
import 'package:flutter/material.dart';
import '../resources/resources.dart';

class CommonTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String? hintText;
  final bool isPassword;
  final TextInputType? textInputType;
  final InputStyleFontField? inputStyle;
  final bool isEnable;
  final double radius;
  final Widget? prefixIcon;
  final Color errorColor;
  final Color borderColor;
  final Color focusBorderColor;
  final EdgeInsetsGeometry contentPadding;
  final EdgeInsetsGeometry prefixIconPadding;
  Function(String)? onChanged;

  CommonTextField(
      {Key? key,
      required this.textEditingController,
      this.onChanged,
      this.hintText,
      this.textInputType,
      this.inputStyle,
      this.prefixIcon,
      this.contentPadding = EdgeInsets.zero,
      this.prefixIconPadding = EdgeInsets.zero,
      this.isPassword = false,
      this.isEnable = true,
      this.radius = 0.0,
      this.errorColor = AppColors.primaryRed,
      this.borderColor = AppColors.cultured,
      this.focusBorderColor = AppColors.darkCharcoal})
      : super(key: key);

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  bool isHaveText = false;
  bool showPassword = false;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    showPassword = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      enabled: widget.isEnable,
      controller: widget.textEditingController,
      focusNode: focusNode,
      obscureText: showPassword,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: AppColors.primaryBlack,
      decoration: InputDecoration(
          contentPadding: widget.contentPadding,
          isDense: true,
          hintText: widget.hintText,
          border: InputBorder.none,
          errorMaxLines: 3,
          prefixIcon: widget.prefixIcon != null
              ? Padding(
                  padding: widget.prefixIconPadding, child: widget.prefixIcon)
              : null,
          suffixIcon: Visibility(
              visible: isHaveText,
              child: IconButton(
                  onPressed: () {
                    if (!widget.isPassword) {
                      widget.textEditingController.clear();
                      FocusScope.of(context).requestFocus(focusNode);
                      setState(() {
                        isHaveText = false;
                      });
                    } else {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    }
                  },
                  icon: Icon(
                    !widget.isPassword
                        ? Icons.cancel
                        : showPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                    color: AppColors.primaryGrey,
                  ))),
          hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: AppColors.primaryGrey,
                fontWeight: FontWeight.w500,
              ),
          errorStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppColors.primaryRed,
                fontWeight: FontWeight.w500,
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.borderColor),
            borderRadius: BorderRadius.circular(widget.radius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.focusBorderColor),
            borderRadius: BorderRadius.circular(widget.radius),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.errorColor),
            borderRadius: BorderRadius.circular(widget.radius),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.errorColor),
            borderRadius: BorderRadius.circular(widget.radius),
          ),
          fillColor: AppColors.cultured,
          filled: true),
      keyboardType: widget.textInputType,
      onChanged: (value) {
        if (value.isEmpty) {
          setState(() {
            isHaveText = false;
          });
        } else {
          setState(() {
            isHaveText = true;
          });
          widget.onChanged?.call(value);
        }
      },
      style: Theme.of(context).textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
      validator: (val) {
        switch (this.widget.inputStyle) {
          case InputStyleFontField.email:
            return Validator(context).email(val);
          case InputStyleFontField.username:
            return Validator(context).username(val);
          case InputStyleFontField.password:
            return Validator(context).password(val);
          case InputStyleFontField.normalText:
            return Validator(context).normalText(val);
          default:
            return null;
        }
      },
    );
  }
}
