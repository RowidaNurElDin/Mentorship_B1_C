import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentoship_rockets_discovries_project/core/helpers/responsive_manager.dart';

import '../../config/theme/themes_manager.dart';
import '../helpers/colors_manager.dart';
import '../helpers/strings_manager.dart';
import '../helpers/values_manager.dart';
import '../themes/presentation/cubit/theme_cubit.dart';
import '../utils/functions.dart';
import '/core/widgets/custom_text.dart';
import 'space.dart';

enum IconAlignment { left, right }

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;

  final Widget? child;
  final String? text;
  final Color? textColor;
  final TextStyle? textStyle;
  final bool isFilled;
  final bool haveShadows;
  final bool transparentButton;
  final BoxShape? shape;
  final Color? color;
  final Color? shadowColor;
  final double? hPadding;
  final double? wPadding;
  final double? hMargin;
  final double? wMargin;
  final double? radius;
  final double? shadowRadius;
  final double? borderWidth;
  final double? textFont;
  final FontWeight? textFontWeight;
  final double? height;
  final double? width;
  final LinearGradient? gradient;
  final Widget? icon;
  final IconAlignment iconAlignment;
  final bool clickable;
  final bool underLinedText;
  final BorderRadius? borderRadius;
  final double? iconSpace;
  final MainAxisAlignment? rowMainAlignment;
  final CrossAxisAlignment? rowCrossAlignment;
  final Border? border;
  final bool isRegular;
  final bool isSemiBold;

  const CustomButton({
    Key? key,
    required this.onTap,
    this.child,
    this.text,
    this.textColor,
    this.isRegular = false,
    this.isSemiBold = false,
    this.textStyle,
    this.isFilled = true,
    this.haveShadows = false,
    this.transparentButton = false,
    this.shape,
    this.color,
    this.shadowColor,
    this.hPadding,
    this.wPadding,
    this.hMargin,
    this.wMargin,
    this.radius,
    this.shadowRadius,
    this.borderWidth,
    this.textFont,
    this.height,
    this.width,
    this.gradient,
    this.icon,
    this.iconAlignment = IconAlignment.left,
    this.clickable = true,
    this.underLinedText = false,
    this.borderRadius,
    this.iconSpace,
    this.rowMainAlignment,
    this.rowCrossAlignment,
    this.border,
    this.textFontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeCubit>().state;

    TextStyle defaultTextStyle = textStyle ??
        ((isRegular)
            ? ThemesManager.blackWhiteRegular(context).copyWith(
                fontWeight: textFontWeight,
                decoration: underLinedText ? TextDecoration.underline : null,
                fontSize: textFont?.rf,
                color: transparentButton || !isFilled
                    ? color ?? ColorsManager.primaryColor
                    : textColor ??
                        (clickable
                            ? ColorsManager.whiteColor
                            : ColorsManager.greyLightColor400))
            : (isSemiBold)
                ? ThemesManager.blackWhiteSemiBold(context).copyWith(
                    fontWeight: textFontWeight,
                    decoration:
                        underLinedText ? TextDecoration.underline : null,
                    fontSize: textFont?.rf,
                    color: transparentButton || !isFilled
                        ? color ?? ColorsManager.primaryColor
                        : textColor ??
                            (clickable
                                ? ColorsManager.whiteColor
                                : ColorsManager.greyLightColor400))
                : ThemesManager.blackWhiteMedium(context).copyWith(
                    fontWeight: textFontWeight,
                    decoration:
                        underLinedText ? TextDecoration.underline : null,
                    fontSize: textFont?.rf,
                    color: transparentButton || !isFilled
                        ? color ?? ColorsManager.primaryColor
                        : textColor ??
                            (clickable
                                ? ColorsManager.whiteColor
                                : ColorsManager.greyLightColor400)));
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(
        vertical: hMargin ?? PaddingValues.zero,
        horizontal: wMargin ?? PaddingValues.zero,
      ),
      child: SizedBox(
        height: height,
        width: width,
        child: Container(
          decoration: BoxDecoration(
              shape: shape ?? BoxShape.rectangle,
              gradient: clickable ? gradient : null,
              borderRadius: shape != null
                  ? null
                  : borderRadius ??
                      BorderRadiusDirectional.circular(
                        radius?.rc ?? BorderValues.b8.rc,
                      ),
              border: border ??
                  (isFilled
                      ? null
                      : Border.all(
                          color: color ?? ColorsManager.greyBoldColor700,
                          width: borderWidth ?? AppSize.s1_5.rs)),
              boxShadow: clickable
                  ? haveShadows && isFilled
                      ? [
                          BoxShadow(
                              offset: Offset(0, 10),
                              spreadRadius: 0,
                              blurRadius:
                                  shadowRadius ?? Values.shadowBlur.toDouble(),
                              color: shadowColor ??
                                  color ??
                                  (gradient == null
                                      ? ColorsManager.primaryColor
                                      : gradient!.colors[0]))
                        ]
                      : null
                  : null,
              color: transparentButton || !isFilled
                  ? ColorsManager.transparent
                  : color ??
                      (clickable
                          ? ColorsManager.primaryLightColor
                          : ColorsManager.greyLightColor300)),
          child: Material(
            color: ColorsManager.transparent,
            child: InkWell(
              highlightColor:
                  clickable ? null : ColorsManager.greyBoldColor700,
              splashColor: clickable
                  ? ColorsManager.whiteLightColor
                  : ColorsManager.greyLightColor300,
              borderRadius: shape != null && shape == BoxShape.circle
                  ? BorderRadius.circular(1000)
                  : borderRadius ??
                      BorderRadius.circular(
                        radius?.rc ?? BorderValues.b8.rc,
                      ),
              onTap: () => clickable ? onTap() : null,
              child: Padding(
                padding: EdgeInsetsDirectional.symmetric(
                  vertical: hPadding ?? PaddingValues.p10.rh,
                  horizontal: wPadding ?? PaddingValues.p15.rw,
                ),
                child: child ??
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment:
                          rowMainAlignment ?? MainAxisAlignment.center,
                      crossAxisAlignment:
                          rowCrossAlignment ?? CrossAxisAlignment.center,
                      children: [
                        if (icon != null && iconAlignment == IconAlignment.left)
                          icon!,
                        if (icon != null && iconAlignment == IconAlignment.left)
                          (iconSpace ?? AppSize.s15).spaceW,
                        CustomText(
                            overflow: TextOverflow.ellipsis,
                            text!,
                            textStyle: defaultTextStyle),
                        if (icon != null &&
                            iconAlignment == IconAlignment.right)
                          (iconSpace ?? AppSize.s15).spaceW,
                        if (icon != null &&
                            iconAlignment == IconAlignment.right)
                          icon!,
                      ],
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
