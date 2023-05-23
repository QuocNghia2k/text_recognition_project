import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../gen/fonts.gen.dart';
import '../widgets/inkwell_wrapper.dart';

enum DialogType {
  error,
  warning,
  success,
  singleBtn,
  doubleBtn,
  report,
  logout,
}

Future<dynamic> showAppDialog({
  required BuildContext context,
  required String errMsg,
  String? title,
  void Function()? onConfirm,
  void Function()? onCancel,
}) async {
  return showDialogWidget(
    context: context,
    message: errMsg,
    title: title,
    titleStyle: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      height: 22 / 17,
      color: Colors.black,
      fontFamily: FontFamily.montserrat,
    ),
    messageStyle: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
      height: 18 / 13,
      color: Colors.black,
      fontFamily: FontFamily.montserrat,
    ),
    confirmButtonStyle: TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.w400,
      height: 22 / 17,
      color: Color(0xFF007AFF),
      fontFamily: FontFamily.montserrat,
    ),
    onConfirm: onConfirm,
    onCancel: onCancel,
    showCancelButton: false,
    dialogRadius: BorderRadius.all(Radius.circular(14.0)),
  );
}

Future<dynamic> showDialogWidget({
  required BuildContext context,
  required String message,
  DialogType dialogType = DialogType.success,
  String? title,
  String? confirmButtonText,
  String? cancelButtonText,
  bool? showCloseBtn,
  void Function()? onConfirm,
  void Function()? onCancel,
  EdgeInsets? insetPadding,
  double? elevation,
  bool? closeAfterCancel,
  double? iconSize,
  bool? canDismiss,
  TextStyle? titleStyle,
  TextStyle? messageStyle,
  TextStyle? confirmButtonStyle,
  TextStyle? cancelButtonStyle,
  bool showCancelButton = true,
  BorderRadius? dialogRadius,
  EdgeInsetsGeometry? buttonPadding,
  Color? buttonBorderColor,
  Color? backgroundColor,
}) async {
  return showCupertinoDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: dialogRadius ?? BorderRadius.zero,
        ),
        backgroundColor: backgroundColor ?? const Color(0xFFF2F2F2).withOpacity(0.8),
        elevation: elevation ?? 0.5,
        insetPadding: insetPadding ?? EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
        child: Container(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(2)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title != null)
                  Container(
                    margin: EdgeInsets.only(
                      top: 16.0,
                      bottom: 2.0,
                    ),
                    child: Text(
                      title,
                      style: titleStyle,
                    ),
                  ),
                Text(
                  message,
                  style: messageStyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: dialogRadius?.bottomLeft ?? Radius.zero,
                    bottomRight: dialogRadius?.bottomRight ?? Radius.zero,
                  ),
                  child: Row(
                    children: [
                      Visibility(
                        visible: showCancelButton,
                        child: Expanded(
                          child: InkWellWrapper(
                            child: Text(
                              cancelButtonText ?? 'Cancel',
                              style: cancelButtonStyle,
                              textAlign: TextAlign.center,
                            ),
                            onTap: onCancel,
                            paddingChild: buttonPadding ??
                                EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                  vertical: 11.0,
                                ),
                            border: Border(
                              top: BorderSide(
                                color: buttonBorderColor ?? Color.fromRGBO(60, 60, 67, 0.36),
                              ),
                              right: BorderSide(
                                color: buttonBorderColor ?? Color.fromRGBO(60, 60, 67, 0.36),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWellWrapper(
                          child: Text(
                            confirmButtonText ?? 'OK',
                            style: confirmButtonStyle,
                            textAlign: TextAlign.center,
                          ),
                          paddingChild: buttonPadding ??
                              EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 11.0,
                              ),
                          border: Border(
                            top: BorderSide(
                              color: buttonBorderColor ?? Color.fromRGBO(60, 60, 67, 0.36),
                            ),
                          ),
                          onTap: onConfirm,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
