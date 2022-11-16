/* Copyright 2022 Laxman Magarati. All rights reserved.
Use of this source code is governed by a BSD-style license that can be
found in the LICENSE file.
*/

import 'package:flutter/material.dart';
import '../models/easyalert_options.dart';
import '../models/easyalert_type.dart';
import '../utils/images.dart';
import '../widgets/easyalert_buttons.dart';

class EasyAlertContainer extends StatelessWidget {
  final EasyAlertOptions? options;

  const EasyAlertContainer({
    Key? key,
    this.options,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final header = buildHeader(context);
    final title = buildTitle(context);
    final text = buildText(context);
    final buttons = buildButtons();
    final widget = buildWidget(context);

    final content = Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          title,
          const SizedBox(
            height: 5.0,
          ),
          text,
          widget!,
          const SizedBox(
            height: 10.0,
          ),
          buttons
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        color: options!.backgroundColor,
        borderRadius: BorderRadius.circular(options!.borderRadius!),
      ),
      clipBehavior: Clip.antiAlias,
      width: options!.width ?? MediaQuery.of(context).size.shortestSide,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [header, content],
      ),
    );
  }

  Widget buildHeader(context) {
    String? anim = AppAnim.success;
    switch (options!.type) {
      case EasyAlertType.success:
        anim = AppAnim.success;
        break;
      case EasyAlertType.error:
        anim = AppAnim.error;
        break;
      case EasyAlertType.warning:
        anim = AppAnim.warning;
        break;
      case EasyAlertType.confirm:
        anim = AppAnim.confirm;
        break;
      case EasyAlertType.info:
        anim = AppAnim.info;
        break;
      case EasyAlertType.loading:
        anim = AppAnim.loading;
        break;
      default:
        anim = AppAnim.info;
        break;
    }

    if (options!.customAsset != null) {
      anim = options!.customAsset;
    }
    return Container(
      width: double.infinity,
      height: 150,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
      ),
      child: Image.asset(
        anim ?? "",
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildTitle(context) {
    final title = options!.title ?? whatTitle();
    return Visibility(
      visible: title != null,
      child: Text(
        '$title',
        style: Theme.of(context).textTheme.headline6!.copyWith(
              color: options!.titleColor,
            ),
      ),
    );
  }

  Widget buildText(context) {
    if (options!.text == null && options!.type != EasyAlertType.loading) {
      return Container();
    } else {
      String? text = '';
      if (options!.type == EasyAlertType.loading) {
        text = options!.text ?? 'Loading';
      } else {
        text = options!.text;
      }
      return Text(
        text ?? '',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: options!.textColor,
        ),
      );
    }
  }

  Widget? buildWidget(context) {
    if (options!.widget == null && options!.type != EasyAlertType.custom) {
      return Container();
    } else {
      Widget widget = Container();
      if (options!.type == EasyAlertType.custom) {
        widget = options!.widget ?? widget;
      }
      return options!.widget;
    }
  }

  Widget buildButtons() {
    if (options!.type == EasyAlertType.loading) {
      return Container();
    } else {
      return EasyAlertButton(
        options: options,
      );
    }
  }

  String? whatTitle() {
    switch (options!.type) {
      case EasyAlertType.success:
        return 'Success';
      case EasyAlertType.error:
        return 'Error';
      case EasyAlertType.warning:
        return 'Warning';
      case EasyAlertType.confirm:
        return 'Are You Sure?';
      case EasyAlertType.info:
        return 'Info';
      case EasyAlertType.custom:
        return null;
      case EasyAlertType.loading:
        return null;
      default:
        return null;
    }
  }
}
