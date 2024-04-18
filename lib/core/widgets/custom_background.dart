import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../helpers/assets_manager.dart';
import '../helpers/colors_manager.dart';
import '../themes/presentation/cubit/theme_cubit.dart';
import 'custom_svg.dart';

//ignore: must_be_immutable
class CustomBackground extends StatelessWidget {
  CustomBackground(
      {super.key, required this.child, this.appBar, this.backgroundColor});

  final Widget child;
  final Widget? appBar;
  Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeCubit>().state;
    return Scaffold(
      backgroundColor: backgroundColor ??
          (themeState == ThemeMode.light
              ? ColorsManager.greyBackgroundColor
              : ColorsManager.darkBackgroundColor),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            themeState == ThemeMode.light
                ? const CustomSvg(
                    AssetsManager.backgroundPattern,
                    fit: BoxFit.fill,
                    size: double.infinity,
                  )
                : const CustomSvg(
                    AssetsManager.backgroundPattern,
                    fit: BoxFit.fill,
                    size: double.infinity,
                    color: ColorsManager.greyBoldColor700,
                  ),
            child,
          ],
        ),
      ),
    );
  }
}
