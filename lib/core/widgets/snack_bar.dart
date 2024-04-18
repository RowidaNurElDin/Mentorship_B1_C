import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:mentoship_rockets_discovries_project/spacex_app.dart';

import '../helpers/colors_manager.dart';
import '../helpers/fonts_manager.dart';
import 'custom_text.dart';

void showSnackBar(
    {ContentType? contentType,
    String? title,
    required BuildContext context,
    required String content}) {
  // String defTitleAr = contentType == null
  //     ? 'خطأ'
  //     : contentType == ContentType.success
  //         ? 'تم'
  //         : 'تنبيه';
  // String defTitleEn = contentType == null
  //     ? 'Error'
  //     : contentType == ContentType.success
  //         ? 'Success'
  //         : 'Warning';
  final snackBar = SnackBar(
    content: CustomText(
      content,
      isSemiBold: true,
      fontSize: FontSize.f14,
      color: ColorsManager.whiteColor,
    ),
  );

  ScaffoldMessenger.of(SpacexApp.navigatorKey.currentContext!)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
