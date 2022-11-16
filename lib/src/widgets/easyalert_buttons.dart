/* Copyright 2022 Laxman Magarati. All rights reserved.
Use of this source code is governed by a BSD-style license that can be
found in the LICENSE file.
*/

import 'package:flutter/material.dart';
import '../models/easyalert_options.dart';
import '../models/easyalert_type.dart';

class EasyAlertButton extends StatelessWidget {
  final EasyAlertOptions? options;

  const EasyAlertButton({
    Key? key,
    this.options,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          cancelBtn(context),
          okayBtn(context),
        ],
      ),
    );
  }

  Widget okayBtn(context) {
    final showCancelBtn =
        options!.type == EasyAlertType.confirm ? true : options!.showCancelBtn!;

    final okayBtn = buildButton(
      context: context,
      isOkayBtn: true,
      text: options!.confirmBtnText!,
      onTap: options!.onConfirmBtnTap ?? () => Navigator.pop(context),
    );

    if (showCancelBtn) {
      return Expanded(child: okayBtn);
    } else {
      return okayBtn;
    }
  }

  Widget cancelBtn(context) {
    final showCancelBtn =
        options!.type == EasyAlertType.confirm ? true : options!.showCancelBtn!;

    final cancelBtn = buildButton(
      context: context,
      isOkayBtn: false,
      text: options!.cancelBtnText!,
      onTap: options!.onCancelBtnTap ?? () => Navigator.pop(context),
    );

    if (showCancelBtn) {
      return Expanded(child: cancelBtn);
    } else {
      return Container();
    }
  }

  Widget buildButton({
    BuildContext? context,
    required bool isOkayBtn,
    required String text,
    VoidCallback? onTap,
  }) {
    final btnText = Text(
      text,
      style: defaultTextStyle(isOkayBtn),
    );

    final okayBtn = MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: options!.confirmBtnColor ?? Theme.of(context!).primaryColor,
      onPressed: onTap,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(7.5),
          child: btnText,
        ),
      ),
    );

    final cancelBtn = GestureDetector(
      onTap: onTap,
      child: Center(
        child: btnText,
      ),
    );

    return isOkayBtn ? okayBtn : cancelBtn;
  }

  TextStyle defaultTextStyle(bool isOkayBtn) {
    final textStyle = TextStyle(
      color: isOkayBtn ? Colors.white : Colors.grey,
      fontWeight: FontWeight.w600,
      fontSize: 18.0,
    );

    if (isOkayBtn) {
      return options!.confirmBtnTextStyle ?? textStyle;
    } else {
      return options!.cancelBtnTextStyle ?? textStyle;
    }
  }
}
