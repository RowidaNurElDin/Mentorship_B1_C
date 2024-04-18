import 'package:flutter/material.dart';
import 'package:mentoship_rockets_discovries_project/core/extensions/extensions.dart';
import 'package:mentoship_rockets_discovries_project/core/helpers/responsive_manager.dart';
import '../../config/theme/themes_manager.dart';
import '../helpers/assets_manager.dart';
import '../helpers/colors_manager.dart';
import '../helpers/fonts_manager.dart';
import '../helpers/values_manager.dart';
import '../themes/presentation/cubit/theme_cubit.dart';
import '../utils/functions.dart';
import 'custom_svg.dart';
import 'custom_text.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown(
      {Key? key,
      required this.hintText,
      required this.onChanged,
      this.validation,
      this.initValue,
      required this.values,
      this.fontSize,
      this.wPadding = PaddingValues.p5,
      this.leftIcon,
      this.svgIcon,
      this.rightIcon,
      this.hintColor})
      : super(key: key);

  final String hintText;
  final void Function(int? value) onChanged;
  final String? Function(int? value)? validation;
  final int? initValue;
  final List<String> values;
  final double? fontSize;
  final double wPadding;
  final Widget? leftIcon;
  final String? svgIcon;
  final Widget? rightIcon;
  final Color? hintColor;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeCubit.get(context).state;
    return Material(
      color: ColorsManager.transparent,
      borderRadius: BorderRadius.circular(BorderValues.b8.rc),
      child: DropdownButtonFormField(
        menuMaxHeight: context.screenHeight / 2,
        icon: rightIcon ??
            CustomSvg(
              AssetsManager.arrowDown,
              color: getLocaleColorFrom(
                  light: ColorsManager.greyLightColor400,
                  dark: ColorsManager.whiteColor,
                  context: context),
            ),
        value: initValue,
        validator: validation,
        style: ThemesManager.blackWhiteRegular12(context).copyWith(
          fontSize: fontSize?.rf,
        ),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorsManager.greySemiBoldColor600,
            ),
            borderRadius: BorderRadius.circular(8)
          ),
          // suffixIcon: rightIcon,
          filled: true,
          fillColor: ThemeCubit.get(context).state == ThemeMode.light
              ? ColorsManager.whiteColor
              : ColorsManager.greyExtraBoldColor800,
          prefixIcon: leftIcon ??
              (svgIcon == null
                  ? null
                  : Padding(
                      padding: EdgeInsetsDirectional.symmetric(
                        horizontal: PaddingValues.p15.rw,
                      ),
                      child: CustomSvg(
                        svgIcon!,
                        color: Theme.of(context)
                            .inputDecorationTheme
                            .suffixIconColor,
                      ),
                    )),
          hintText: hintText,
        ).copyWith(
            contentPadding: EdgeInsetsDirectional.symmetric(
              vertical: PaddingValues.p10.rh,
              horizontal: PaddingValues.p12.rw,
            ),
            hintStyle: ThemesManager.blackWhiteRegular12(context).copyWith(
                fontSize: fontSize?.rf ?? FontSize.f14,
                color: hintColor ?? ColorsManager.greyMediumColor500)),
        onChanged: onChanged,
        items: List.generate(values.length, (index) {
          return DropdownMenuItem(
            value: index,
            child: CustomText(
              values[index],
              fontSize: fontSize ?? FontSize.f10,
              color: theme == ThemeMode.dark
                  ? ColorsManager.whiteColor
                  : ColorsManager.blackColor,
              isRegular: true,
            ),
          );
        }),
      ),
    );
  }
}
