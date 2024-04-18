import 'dart:math';
import 'package:flutter/material.dart';

extension MediaQueryHelper on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;

  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenAspectRatio => MediaQuery.of(this).size.aspectRatio;

  double get screenPadding => MediaQuery.of(this).padding.top;

  double get statusBarHeight => MediaQuery.of(this).padding.top;

  double get bottomBarHeight => MediaQuery.of(this).padding.bottom;

  double get screenBottomPadding => MediaQuery.of(this).padding.bottom;

  double get screenTopPadding => MediaQuery.of(this).padding.top;

  double get screenLeftPadding => MediaQuery.of(this).padding.left;

  double get screenRightPadding => MediaQuery.of(this).padding.right;

  double get screenBottomInset => MediaQuery.of(this).viewInsets.bottom;

  double get screenTopInset => MediaQuery.of(this).viewInsets.top;

  double get screenLeftInset => MediaQuery.of(this).viewInsets.left;

  double get screenRightInset => MediaQuery.of(this).viewInsets.right;

  double get screenBottomSafeArea => MediaQuery.of(this).padding.bottom;

  double get screenTopSafeArea => MediaQuery.of(this).padding.top;

  double get screenLeftSafeArea => MediaQuery.of(this).padding.left;

  double get screenRightSafeArea => MediaQuery.of(this).padding.right;
}

extension NavigatorHelper on BuildContext {
  void push(Widget widget) {
    Navigator.of(this).push(
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  void pop() {
    Navigator.of(this).pop();
  }

  void pushReplacement(Widget widget) {
    Navigator.of(this).pushReplacement(MaterialPageRoute(
      builder: (context) => widget,
    ));
  }

  void pushAndRemoveUtils(Widget widget) {
    Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => widget),
          (route) => false,
    );
  }
}

extension PaddingWidget on Widget {
  Widget padding(EdgeInsets edgeInsets) {
    return Padding(
      padding: edgeInsets,
      child: this,
    );
  }
}

extension RandomListItem<T> on List<T> {
  T randomItem() {
    return this[Random().nextInt(length)];
  }
}

extension ShowDataInOwnFormat on DateTime {
  String showDateInOwnFormat() {
    return '$day/$month/$year';
  }}
