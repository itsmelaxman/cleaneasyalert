/* Copyright 2022 Laxman Magarati. All rights reserved.
Use of this source code is governed by a BSD-style license that can be
found in the LICENSE file.
*/

import 'dart:async';
import 'package:flutter/material.dart';
import '../models/easyalert_animtype.dart';
import '../models/easyalert_options.dart';
import '../models/easyalert_type.dart';
import '../utils/animate.dart';
import '../widgets/easyalert_container.dart';

/// EasyAlert
class EasyAlert {
  /// Instantly display animated alert dialogs such as success, error, warning, confirm, loading or even a custom dialog.
  static Future show({
    /// BuildContext
    required BuildContext context,

    /// Title of the dialog
    String? title,

    /// Text of the dialog
    String? text,

    /// Custom Widget of the dialog
    Widget? widget,

    /// Alert type [success, error, warning, confirm, info, loading, custom]
    required EasyAlertType type,

    /// Animation type  [scale, rotate, slideInDown, slideInUp, slideInLeft, slideInRight]
    EasyAlertAnimType animType = EasyAlertAnimType.scale,

    /// Barrier Dissmisable
    bool barrierDismissible = true,

    /// Triggered when confirm button is tapped
    VoidCallback? onConfirmBtnTap,

    /// Triggered when cancel button is tapped
    VoidCallback? onCancelBtnTap,

    /// Confirmation button text
    String confirmBtnText = 'Okay',

    /// Cancel button text
    String cancelBtnText = 'Cancel',

    /// Color for confirm button
    Color confirmBtnColor = Colors.blue,

    /// TextStyle for confirm button
    TextStyle? confirmBtnTextStyle,

    /// TextStyle for cancel button
    TextStyle? cancelBtnTextStyle,

    /// Backgroung Color for dialog
    Color backgroundColor = Colors.white,

    /// Color of title
    Color titleColor = Colors.black,

    /// Color of text
    Color textColor = Colors.black,

    /// Barrier Color of dialog
    Color? barrierColor,

    /// Determines if cancel button is shown or not
    bool showCancelBtn = false,

    /// Dialog Border Radius
    double borderRadius = 15.0,

    /// Asset path of your Image file
    String? customAsset,

    /// Width of the dialog
    double? width,

    /// Determines how long the dialog stays open for before closing, [default] is null. When it is null, it won't autoclose
    Duration? autoCloseDuration,
  }) {
    if (autoCloseDuration != null) {
      Future.delayed(autoCloseDuration, () {
        Navigator.of(context, rootNavigator: true).pop();
      });
    }

    final options = EasyAlertOptions(
      title: title,
      text: text,
      widget: widget,
      type: type,
      animType: animType,
      barrierDismissible: barrierDismissible,
      onConfirmBtnTap: onConfirmBtnTap,
      onCancelBtnTap: onCancelBtnTap,
      confirmBtnText: confirmBtnText,
      cancelBtnText: cancelBtnText,
      confirmBtnColor: confirmBtnColor,
      confirmBtnTextStyle: confirmBtnTextStyle,
      cancelBtnTextStyle: cancelBtnTextStyle,
      backgroundColor: backgroundColor,
      titleColor: titleColor,
      textColor: textColor,
      showCancelBtn: showCancelBtn,
      borderRadius: borderRadius,
      customAsset: customAsset,
      width: width,
    );

    final child = AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      content: EasyAlertContainer(
        options: options,
      ),
    );

    return showGeneralDialog(
      barrierColor: barrierColor ?? Colors.black.withOpacity(0.5),
      transitionBuilder: (context, anim1, __, widget) {
        switch (animType) {
          case EasyAlertAnimType.scale:
            return Animate.scale(child: child, animation: anim1);

          case EasyAlertAnimType.rotate:
            return Animate.rotate(child: child, animation: anim1);

          case EasyAlertAnimType.slideInDown:
            return Animate.slideInDown(child: child, animation: anim1);

          case EasyAlertAnimType.slideInUp:
            return Animate.slideInUp(child: child, animation: anim1);

          case EasyAlertAnimType.slideInLeft:
            return Animate.slideInLeft(child: child, animation: anim1);

          case EasyAlertAnimType.slideInRight:
            return Animate.slideInRight(child: child, animation: anim1);

          default:
            return child;
        }
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible:
          autoCloseDuration != null ? false : barrierDismissible,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, _, __) => Container(),
    );
  }
}
