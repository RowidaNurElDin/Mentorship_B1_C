import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/colors_manager.dart';
import '../helpers/fonts_manager.dart';
import '../locale/presentation/cubit/locale_cubit.dart';
import '../themes/presentation/cubit/theme_cubit.dart';

class RichTextRow extends StatelessWidget {
  const RichTextRow(
      {super.key,
      required this.firstText,
      required this.secondText,
      this.onTapRecognizer});

  final String firstText;
  final String secondText;
  final GestureTapCallback? onTapRecognizer;

  @override
  Widget build(BuildContext context) {
    final String language = LocaleCubit.get(context).state.languageCode;
    final themeState = context.watch<ThemeCubit>().state;

    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(
              text: firstText,
              style: FontStyles.getMediumStyle(language: language).copyWith(
                  color: (themeState == ThemeMode.light
                      ? ColorsManager.greyMediumColor500
                      : ColorsManager.whiteExtraColor),
                  fontSize: FontSize.f14.sp)),
          TextSpan(
            text: secondText,
            style: FontStyles.getSemiBoldStyle(language: language).copyWith(
                color: ColorsManager.primaryLightColor,
                fontSize: FontSize.f14.sp),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                onTapRecognizer?.call();
              },
          ),
        ],
      ),
    );
  }
}
