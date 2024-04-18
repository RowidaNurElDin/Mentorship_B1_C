import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../helpers/assets_manager.dart';
import '../../../helpers/colors_manager.dart';
import '../../../helpers/values_manager.dart';
import '../cubit/theme_cubit.dart';
import '/core/widgets/custom_button.dart';
import '/core/widgets/custom_svg.dart';

class ThemeButton extends StatelessWidget {
  final double? hMargin;
  final double? wMargin;
  final Color? backGroundColor;
  final Color? iconColor;
  // ignore: prefer_const_constructors_in_immutables
  ThemeButton({
    Key? key,
    this.hMargin,
    this.wMargin,
    this.backGroundColor,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) => CustomButton(
            hMargin: hMargin ?? AppSize.s10,
            wMargin: wMargin ?? AppSize.s10,
            hPadding: AppSize.s8,
            wPadding: AppSize.s8,
            color: backGroundColor ??
                (state == ThemeMode.dark
                    ? ColorsManager.whiteLightColor
                    : ColorsManager.blackLightColor),
            shape: BoxShape.circle,
            onTap: () {
              // ThemeCubit.get(context).changeCurrentThemeMode();
            },
            child: CustomSvg(
              state == ThemeMode.dark
                  ? AssetsManager.darkThemeIcon
                  : AssetsManager.lightThemeIcon,
              color: iconColor,
            )));
  }
}
