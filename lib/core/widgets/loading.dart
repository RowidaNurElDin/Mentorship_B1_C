import 'dart:io';

import 'package:flutter/material.dart';

import '../helpers/colors_manager.dart';


class LoadingDialog extends StatelessWidget {
  const LoadingDialog({
    Key? key,
    this.backgroundColor,
  }) : super(key: key);

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: backgroundColor ??
            (Platform.isAndroid
                ? Colors.black.withOpacity(0.6)
                : Colors.black.withOpacity(0.8)),
        body: const Center(
          child: CustomLoading(),
        ),
      ),
    );
  }
}

class CustomLoading extends StatelessWidget {
  const CustomLoading({
    Key? key,
    this.color,
  }) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator.adaptive(
      valueColor:
          AlwaysStoppedAnimation<Color>(color ?? ColorsManager.primaryColor),
      backgroundColor: Platform.isAndroid
          ? ColorsManager.transparent
          : color ?? ColorsManager.primaryColor,
    );
  }
}
