import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentoship_rockets_discovries_project/core/helpers/responsive_manager.dart';
import '../helpers/colors_manager.dart';
import '../helpers/fonts_manager.dart';
import '../helpers/values_manager.dart';
import '../themes/presentation/cubit/theme_cubit.dart';
import '../utils/functions.dart';
import '/config/theme/themes_manager.dart';
import '/core/widgets/custom_text.dart';
import 'custom_back_arrow.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final PreferredSizeWidget? bottom;
  final Color? titleColor;
  final Color? backGroundColor;
  final bool centerTitle;
  final List<Widget>? actions;
  final Widget? leading;
  final double? elevation;
  final Color? backIconColor;
  bool showLeading;
  bool showActions;
  final FontWeight? titleFontWeight;
  final double? titleFontSize;

  void Function()? onBackClick;

  CustomAppBar(
      {Key? key,
      this.title,
      this.titleWidget,
      this.bottom,
      this.titleColor,
      this.backGroundColor,
      this.centerTitle = false,
      this.actions,
      this.leading,
      this.elevation,
      this.backIconColor,
      this.showLeading = false,
      this.onBackClick,
      this.showActions = false,
      this.titleFontWeight,
      this.titleFontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeCubit>().state;
    void popBack() {
      Navigator.pop(context);
    }

    if (leading != null) showLeading = true;
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: ColorsManager.transparent,

        // Status bar brightness (optional)

        statusBarIconBrightness: themeState == ThemeMode.dark ? Brightness.light : Brightness.dark,

        // For Android (dark icons)

        statusBarBrightness: themeState == ThemeMode.dark ? Brightness.dark : Brightness.light, // For iO
      ),
      surfaceTintColor: ColorsManager.transparent,
      bottom: bottom,
      backgroundColor: backGroundColor ?? ColorsManager.transparent,
      elevation: elevation,
      automaticallyImplyLeading: showLeading,
      leading: showLeading
          ? leading ??
              Padding(
                padding: EdgeInsetsDirectional.only(start: AppSize.s20.rw),
                child: CustomBackArrow(
                  onTap: onBackClick ?? popBack,
                  color: backIconColor ?? ColorsManager.whiteColor,
                ),
              ) // CustomButton(
          //   shape: BoxShape.circle,
          //   color: ColorsManager.transparent,
          //   onTap: onBackClick ?? popBack,
          //   child: Icon(
          //     Icons.arrow_back_ios,
          //     color: backIconColor ?? ColorsManager.whiteColor,
          //   ),
          // )
          : null,
      centerTitle: centerTitle,
      actions: actions ?? (showActions ? customActions(context) : null),
      title: titleWidget ??
          (title == null
              ? null
              : CustomText(
                  title!,
                  textStyle:
                      ThemesManager.blackWhiteRegular18(context).copyWith(
                    color: titleColor ??
                        (themeState != ThemeMode.light
                            ? ColorsManager.whiteColor
                            : ColorsManager.blackColor),
                    fontWeight: titleFontWeight ?? FontWeight.w700,
                    fontSize: titleFontSize ?? FontSize.f16,
                      ),
                )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
