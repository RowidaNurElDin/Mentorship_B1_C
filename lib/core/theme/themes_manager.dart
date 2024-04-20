import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mentoship_rockets_discovries_project/core/helpers/responsive_manager.dart';

import '../../core/helpers/colors_manager.dart';
import '../../core/helpers/fonts_manager.dart';
import '../../core/helpers/values_manager.dart';

class Themes {
  static AppBarTheme _appBarTheme(ThemeData themeData) {
    return AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: ColorsManager.backgroundColor,
          statusBarBrightness: Brightness.light,
      ),
      backgroundColor: ColorsManager.primaryColor,
      actionsIconTheme: themeData.iconTheme,
      elevation: 0,
      iconTheme: themeData.iconTheme,
    );
  }

  static AppBarTheme _appBarDarkTheme(ThemeData themeData) {
    return AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: ColorsManager.darkBackgroundColor,
          statusBarBrightness: Brightness.dark,
      ),
      backgroundColor: ColorsManager.darkBackgroundColor,
      actionsIconTheme: themeData.iconTheme,
      elevation: 0,
      iconTheme: themeData.iconTheme,
    );
  }

  static InputBorder _customBorder(Color color) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(BorderValues.b12.rc),
        borderSide: BorderSide(color: color, width: 1.rs));
  }

  static TabBarTheme _customTabBar(Color color) {
    return TabBarTheme(
      indicatorColor: color,
      labelColor: color,
      overlayColor: MaterialStateProperty.all<Color>(color.withOpacity(0.2)),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: color),
      ),
    );
  }

  static CheckboxThemeData _checkBoxThemeData() {
    return const CheckboxThemeData(
      shape: CircleBorder(),
    );
  }

  static ThemeData datePickerThemeData() {
    return ThemeData(
      primaryColor: ColorsManager.primaryColor,
      colorScheme: const ColorScheme.light(primary: ColorsManager.primaryColor),
      buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
    );
  }

  static DatePickerThemeData _datePickerThemeData() {
    return DatePickerThemeData(
      headerBackgroundColor: ColorsManager.primaryColor,
      todayBackgroundColor:
          MaterialStateProperty.all(ColorsManager.primaryColor),
      rangeSelectionBackgroundColor: ColorsManager.primaryColor,
    );
  }

  static ThemeData getLightTheme({required String language}) {
    return ThemeData(
      brightness: Brightness.light,
      bottomNavigationBarTheme: _lightBottomNavBar(),
      scaffoldBackgroundColor: ColorsManager.backgroundColor,
      primaryColor: ColorsManager.primaryColor,
      splashColor: ColorsManager.primaryLightColor,
      appBarTheme: _appBarTheme(ThemeData.light()),
      textTheme: _lightTextTheme(language: language),
      datePickerTheme: _datePickerThemeData(),
      iconTheme: const IconThemeData(
        color: ColorsManager.greyMediumColor500,
      ),
      checkboxTheme: _checkBoxThemeData(),
      hintColor: ColorsManager.greyExtraLightColor,
      inputDecorationTheme: _lightInputDecoratorTheme(language: language),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ColorsManager.primaryColor,
      ),
      tabBarTheme: _customTabBar(Colors.black),
    );
  }

  static TextTheme _lightTextTheme({required String language}) {
    return TextTheme(
      titleLarge: FontStyles.getSemiBoldStyle(language: language).copyWith(
        color: ColorsManager.greyMediumColor500,
        fontSize: FontSize.f28.rf,
      ),
      titleMedium: FontStyles.getMediumStyle(language: language).copyWith(
        color: ColorsManager.greyMediumColor500,
        fontSize: FontSize.f26.rf,
      ),
      titleSmall: FontStyles.getRegularStyle(language: language).copyWith(
        color: ColorsManager.greyMediumColor500,
        fontSize: FontSize.f30.rf,
      ),
      headlineLarge: FontStyles.getRegularStyle(language: language).copyWith(
        color: ColorsManager.greyMediumColor500,
        fontSize: FontSize.f24.rf,
      ),
      headlineMedium: FontStyles.getRegularStyle(language: language).copyWith(
        color: ColorsManager.greyMediumColor500,
        fontSize: FontSize.f18.rf,
      ),
      headlineSmall: FontStyles.getRegularStyle(language: language).copyWith(
        color: ColorsManager.greyMediumColor500,
        fontSize: FontSize.f15.rf,
      ),
      bodyLarge: FontStyles.getRegularStyle(language: language).copyWith(
        color: ColorsManager.greyMediumColor500,
        fontSize: FontSize.f16.rf,
      ),
      bodyMedium: FontStyles.getRegularStyle(language: language).copyWith(
        color: ColorsManager.greyMediumColor500,
        fontSize: FontSize.f14.rf,
      ),
      bodySmall: FontStyles.getRegularStyle(language: language).copyWith(
        color: ColorsManager.greyMediumColor500,
        fontSize: FontSize.f12.rf,
      ),
      labelLarge:  FontStyles.getRobotoStyle(language: language).copyWith(
        color: ColorsManager.greyMediumColor500,
        fontSize: FontSize.f12.rf,
      ),
    );
  }

  static InputDecorationTheme _lightInputDecoratorTheme(
      {required String language}) {
    return InputDecorationTheme(
      contentPadding: const EdgeInsetsDirectional.symmetric(
        vertical: PaddingValues.zero,
        horizontal: PaddingValues.zero,
      ),
      errorStyle: FontStyles.getRegularStyle(language: language)
          .copyWith(
            color: ColorsManager.greyMediumColor500,
            fontSize: FontSize.f8.rf,
            height: .2,
          )
          .copyWith(
            fontSize: FontSize.f8.rf,
            height: .2,
            color: ColorsManager.redColor,
          ),
      errorMaxLines: 2,
      hintStyle: FontStyles.getRegularStyle(language: language)
          .copyWith(
            color: ColorsManager.greyMediumColor500,
            fontSize: FontSize.f16.rf,
          )
          .copyWith(color: const Color(0xff828282)),
      prefixIconColor: ColorsManager.greyMediumColor500,
      suffixIconColor: ColorsManager.greyMediumColor500,
      filled: true,
      fillColor: const Color(0xffFFFFFF),
      errorBorder: _customBorder(ColorsManager.redColor),
      focusedBorder: _customBorder(ColorsManager.primaryColor),
      focusedErrorBorder: _customBorder(ColorsManager.redColor),
      border: _customBorder(ColorsManager.greyLightColor300),
      enabledBorder: _customBorder(ColorsManager.greyLightColor300),
    );
  }

  static BottomNavigationBarThemeData _lightBottomNavBar() {
    return const BottomNavigationBarThemeData(
      elevation: AppSize.s20,
      backgroundColor: ColorsManager.whiteColor,
      selectedItemColor: ColorsManager.primaryColor,
    );
  }

  static ThemeData getDarkTheme({required String language}) {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: ColorsManager.darkBackgroundColor,
      primaryColor: ColorsManager.primaryColor,
      splashColor: ColorsManager.primaryLightColor,
      bottomNavigationBarTheme: _darkBottomNavBar(),
      appBarTheme: _appBarDarkTheme(ThemeData.dark()),
      textTheme: _darkTextTheme(language: language),
      iconTheme: const IconThemeData(
        color: ColorsManager.lightBlueColor,
      ),
      checkboxTheme: _checkBoxThemeData(),
      inputDecorationTheme: _darkInputDecoratorTheme(language),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ColorsManager.primaryColor,
      ),
      tabBarTheme: _customTabBar(Colors.white),
    );
  }

  static TextTheme _darkTextTheme({required String language}) {
    return TextTheme(
      titleLarge: FontStyles.getSemiBoldStyle(language: language).copyWith(
        color: ColorsManager.whiteExtraColor,
        fontSize: FontSize.f28.rf,
      ),
      titleMedium: FontStyles.getMediumStyle(language: language).copyWith(
        color: ColorsManager.whiteExtraColor,
        fontSize: FontSize.f26.rf,
      ),
      titleSmall: FontStyles.getRegularStyle(language: language).copyWith(
        color: ColorsManager.whiteExtraColor,
        fontSize: FontSize.f30.rf,
      ),
      headlineLarge: FontStyles.getRegularStyle(language: language).copyWith(
        color: ColorsManager.whiteExtraColor,
        fontSize: FontSize.f24.rf,
      ),
      headlineMedium: FontStyles.getRegularStyle(language: language).copyWith(
        color: ColorsManager.whiteExtraColor,
        fontSize: FontSize.f18.rf,
      ),
      headlineSmall: FontStyles.getRegularStyle(language: language).copyWith(
        color: ColorsManager.whiteExtraColor,
        fontSize: FontSize.f15.rf,
      ),
      bodyLarge: FontStyles.getRegularStyle(language: language).copyWith(
        color: ColorsManager.whiteExtraColor,
        fontSize: FontSize.f16.rf,
      ),
      bodyMedium: FontStyles.getRegularStyle(language: language).copyWith(
        color: ColorsManager.whiteExtraColor,
        fontSize: FontSize.f14.rf,
      ),
      bodySmall: FontStyles.getRegularStyle(language: language).copyWith(
        color: ColorsManager.whiteExtraColor,
        fontSize: FontSize.f12.rf,
      ),
    );
  }

  static InputDecorationTheme _darkInputDecoratorTheme(String language) {
    return InputDecorationTheme(
      contentPadding: const EdgeInsetsDirectional.symmetric(
        vertical: PaddingValues.zero,
        horizontal: PaddingValues.zero,
      ),
      errorStyle: FontStyles.getRegularStyle(language: language)
          .copyWith(
            color: ColorsManager.whiteExtraColor,
            fontSize: FontSize.f8.rf,
            height: .2,
          )
          .copyWith(
            fontSize: FontSize.f8.rf,
            height: .2,
            color: ColorsManager.redColor,
          ),
      errorMaxLines: 2,
      hintStyle: FontStyles.getRegularStyle(language: language)
          .copyWith(
            color: ColorsManager.greyLightColor400,
            fontSize: FontSize.f16.rf,
          )
          .copyWith(color:  ColorsManager.greyLightColor400),
      prefixIconColor: ColorsManager.lightBlueColor,
      suffixIconColor: ColorsManager.lightBlueColor,
      filled: true,
      fillColor: ColorsManager.greyDarkColor,
      errorBorder: _customBorder(ColorsManager.redColor),
      focusedBorder: _customBorder(ColorsManager.greyExtraBoldColor800),
      focusedErrorBorder: _customBorder(ColorsManager.redColor),
      border: _customBorder(ColorsManager.greyExtraBoldColor800),
      enabledBorder: _customBorder(ColorsManager.greyExtraBoldColor800),
    );
  }

  static BottomNavigationBarThemeData _darkBottomNavBar() {
    return const BottomNavigationBarThemeData(
      elevation: AppSize.s20,
      backgroundColor: ColorsManager.greyDarkColor,
      selectedItemColor: ColorsManager.primaryColor,
    );
  }
}

class ThemesManager {
  static Color getSecondaryColorAsTheme(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? ColorsManager.primaryLightColor
        : ColorsManager.primaryDarkColor;
  }

  static Color getSecondaryColorOtherTheme(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? ColorsManager.primaryLightColor
        : ColorsManager.primaryDarkColor;
  }

  static Color getOptionFrom({
    required dynamic light,
    required dynamic dark,
    required BuildContext context,
  }) {
    return Theme.of(context).brightness == Brightness.light ? light : dark;
  }

  static TextStyle blackWhiteRegular12(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall!;
  }

  static TextStyle blackWhiteRegular(BuildContext context) {
    return Theme.of(context).textTheme.titleSmall!;
  }

  static TextStyle blackWhiteMedium(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium!;
  }

  static TextStyle blackWhiteSemiBold(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge!;
  }

  static TextStyle blackWhiteRegular14(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!;
  }

  static TextStyle blackWhiteRegular16(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge!;
  }

  static TextStyle blackWhiteRegular15(BuildContext context) {
    return Theme.of(context).textTheme.headlineSmall!;
  }

  static TextStyle blackWhiteRegular18(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium!;
  }

  static TextStyle blackWhiteRegular24(BuildContext context) {
    return Theme.of(context).textTheme.headlineLarge!;
  }

  static TextStyle blackWhiteRegular30(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge!;
  }

  static TextStyle blackWhiteSemiBold26(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium!;
  }

  static TextStyle blackWhiteSemiBold28(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge!;
  }

  static TextStyle blackWhiteSemiBold30(BuildContext context) {
    return Theme.of(context).textTheme.titleSmall!;
  }
}
