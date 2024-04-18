import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mentoship_rockets_discovries_project/core/helpers/responsive_manager.dart';

import '../helpers/colors_manager.dart';
import '../helpers/fonts_manager.dart';
import '../helpers/values_manager.dart';

void showToast(String msg,
    {int time = Values.toastTime,
    Toast toastLength = Toast.LENGTH_SHORT,
    ToastGravity toastGravity = ToastGravity.BOTTOM,
    Color backGroundColor = ColorsManager.greyDarkColor,
    Color textColor = ColorsManager.whiteColor,
    double fontSize = FontSize.f16}) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
    msg: msg,
    toastLength: toastLength,
    gravity: toastGravity,
    backgroundColor: backGroundColor,
    timeInSecForIosWeb: time,
    webPosition: 'center',
    textColor: textColor,
    fontSize: fontSize.rf,
  );
}
