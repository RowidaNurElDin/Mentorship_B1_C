import 'package:flutter/material.dart';
import '../helpers/colors_manager.dart';
import '../helpers/fonts_manager.dart';
import '../helpers/values_manager.dart';
import '../themes/presentation/cubit/theme_cubit.dart';
import 'custom_back_arrow.dart';
import 'custom_text.dart';

class CustomButtonWithArrow extends StatelessWidget {
  const CustomButtonWithArrow({
    super.key,
    required this.onTap,
    required this.title,
    this.icon,
    this.backgroundColor,
  });

  final Function() onTap;
  final String title;
  final Widget? icon;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeCubit.get(context).state;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor ??
              (theme == ThemeMode.dark
                  ? ColorsManager.greyExtraBoldColor800
                  : ColorsManager.whiteExtraColor),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: theme == ThemeMode.dark
                ? ColorsManager.greyBoldColor700
                : ColorsManager.greyExtraLightColor200,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(PaddingValues.p16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                title,
                fontSize: FontSize.f14,
                isSemiBold: true,
                color: theme == ThemeMode.dark
                    ? ColorsManager.whiteColor
                    : ColorsManager.blackColor,
              ),
              icon ??
                  CustomBackArrow(
                    onTap: () {
                    },
                    color: theme == ThemeMode.dark
                        ? ColorsManager.whiteColor
                        : ColorsManager.blackColor,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
