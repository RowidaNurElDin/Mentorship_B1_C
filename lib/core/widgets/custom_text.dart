import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mentoship_rockets_discovries_project/core/helpers/responsive_manager.dart';
import '../helpers/colors_manager.dart';
import '../helpers/fonts_manager.dart';
import '../theme/themes_manager.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final double? fontSize;
  final bool isRegular;
  final bool isSemiBold;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool autoSize;
  final double? minFontSize;
  final double? height;

  const CustomText(this.text,
      {Key? key,
      this.isRegular = false,
      this.isSemiBold = false,
      this.textStyle,
      this.textAlign,
      this.fontSize,
      this.color,
      this.maxLines,
      this.overflow,
      this.minFontSize,
      this.autoSize = false,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextStyle defaultTextStyle = textStyle ??
        ((isRegular)
            ? ThemesManager.blackWhiteRegular(context).copyWith(
                color: color,
                fontSize: fontSize,
                overflow: overflow,
                height: height)
            : (isSemiBold)
                ? ThemesManager.blackWhiteSemiBold(context).copyWith(
                    color: color,
                    fontSize: fontSize,
                    overflow: overflow,
                    height: height,
                  )
                : ThemesManager.blackWhiteMedium(context).copyWith(
                    color: color ,
                    fontSize: fontSize,
                    overflow: overflow,
                    height: height,
                  ));
    if (autoSize) {
      return AutoSizeText(
        text,
        minFontSize: minFontSize?.rf ?? 5.rf,
        stepGranularity: minFontSize?.rf ?? 1.rf,
        maxFontSize: fontSize?.rf ?? FontSize.f16.rf,
        style: defaultTextStyle,
        textAlign: textAlign ?? TextAlign.center,
        maxLines: maxLines,
      );
    }
    return Text(
      text,
      style: defaultTextStyle,
      textAlign: textAlign ?? TextAlign.center,
      maxLines: maxLines,
    );
  }
}
