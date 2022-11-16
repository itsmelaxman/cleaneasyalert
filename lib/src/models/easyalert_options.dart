/* Copyright 2022 Laxman Magarati. All rights reserved.
Use of this source code is governed by a BSD-style license that can be
found in the LICENSE file.
*/

import 'package:flutter/widgets.dart';
import '../models/easyalert_animtype.dart';
import '../models/easyalert_type.dart';

/// Alert Options
class EasyAlertOptions {
  /// Title of the dialog
  String? title;

  /// Text of the dialog
  String? text;

  /// Custom Widget of the dialog
  Widget? widget;

  /// Alert type [success, error, warning, confirm, info, loading, custom]
  EasyAlertType type;

  /// Animation type  [scale, rotate, slideInDown, slideInUp, slideInLeft, slideInRight]
  EasyAlertAnimType? animType;

  /// Barrier Dissmisable
  bool? barrierDismissible = false;

  /// Triggered when confirm button is tapped
  VoidCallback? onConfirmBtnTap;

  /// Triggered when cancel button is tapped
  VoidCallback? onCancelBtnTap;

  /// Confirmation button text
  String? confirmBtnText;

  /// Cancel button text
  String? cancelBtnText;

  /// Color for confirm button
  Color? confirmBtnColor;

  /// TextStyle for confirm button
  TextStyle? confirmBtnTextStyle;

  /// TextStyle for cancel button
  TextStyle? cancelBtnTextStyle;

  /// Backgroung Color for dialog
  Color? backgroundColor;

  /// Color of title
  Color? titleColor;

  /// Color of text
  Color? textColor;

  /// Determines if cancel button is shown or not
  bool? showCancelBtn;

  /// Dialog Border Radius
  double? borderRadius;

  /// Asset path of your Image file
  String? customAsset;

  /// Width of the dialog
  double? width;

  /// Alert Options
  EasyAlertOptions({
    /// Title of the dialog
    this.title,

    /// Text of the dialog
    this.text,

    /// Custom Widget of the dialog
    this.widget,

    /// Alert type [success, error, warning, confirm, info, loading, custom]
    required this.type,

    /// Animation type  [scale, rotate, slideInDown, slideInUp, slideInLeft, slideInRight]
    this.animType,

    /// Barrier Dissmisable
    this.barrierDismissible,

    /// Triggered when confirm button is tapped
    this.onConfirmBtnTap,

    /// Triggered when cancel button is tapped
    this.onCancelBtnTap,

    /// Confirmation button text
    this.confirmBtnText,

    /// Cancel button text
    this.cancelBtnText,

    /// Color for confirm button
    this.confirmBtnColor,

    /// TextStyle for confirm button
    this.confirmBtnTextStyle,

    /// TextStyle for cancel button
    this.cancelBtnTextStyle,

    /// Backgroung Color for dialog
    this.backgroundColor,

    /// Color of title
    this.titleColor,

    /// Color of text
    this.textColor,

    /// Determines if cancel button is shown or not
    this.showCancelBtn,

    /// Dialog Border Radius
    this.borderRadius,

    /// Asset path of your Image file
    this.customAsset,

    /// Width of the dialog
    this.width,
  });
}
