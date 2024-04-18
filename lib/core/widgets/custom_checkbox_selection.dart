import 'package:flutter/material.dart';
import 'package:mentoship_rockets_discovries_project/core/helpers/responsive_manager.dart';
import 'package:mentoship_rockets_discovries_project/core/helpers/values_manager.dart';
import 'package:mentoship_rockets_discovries_project/core/widgets/space.dart';
import '../helpers/colors_manager.dart';
import '../helpers/fonts_manager.dart';
import 'custom_button.dart';
import 'custom_text.dart';

class CustomCheckBoxSelection extends StatelessWidget {
  final VoidCallback onTap;
  final String? title;
  final bool isSelected;
  final bool showCheckBox;
  final BoxShape? boxShape;
  final Widget? child;
  final Widget? titleChild;
  final int? fadeSpeed;
  final Color? backGroundColor;
  final double? hMargin;
  const CustomCheckBoxSelection({
    Key? key,
    required this.onTap,
    this.title,
    required this.isSelected,
    required this.showCheckBox,
    this.boxShape,
    this.child,
    this.titleChild,
    this.fadeSpeed,
    this.backGroundColor,
    this.hMargin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      hMargin: hMargin ?? PaddingValues.zero,
      wPadding: PaddingValues.zero,
      hPadding: PaddingValues.zero,
      transparentButton: true,
      onTap: onTap,
      child: Row(
        children: [
          if (showCheckBox)
            AnimatedContainer(
              duration:
                  Duration(milliseconds: fadeSpeed ?? AppSize.s250.toInt()),
              width: boxShape != null && boxShape == BoxShape.circle
                  ? AppSize.s20.rs
                  : AppSize.s20.rs,
              height: boxShape != null && boxShape == BoxShape.circle
                  ? AppSize.s20.rs
                  : AppSize.s20.rs,
              decoration: BoxDecoration(
                  shape: boxShape ?? BoxShape.rectangle,
                  border: Border.all(
                      width: AppSize.s1.rs,
                      color: ColorsManager.greyMediumColor500),
                  color: child == null
                      ? isSelected
                          ? ColorsManager.primaryColor
                          : backGroundColor ?? ColorsManager.whiteColor
                      : backGroundColor ?? ColorsManager.whiteColor,
                  borderRadius: boxShape != null && boxShape == BoxShape.circle
                      ? null
                      : BorderRadius.circular(BorderValues.b5.rc)),
              child: child == null
                  ? null
                  : AnimatedOpacity(
                      opacity: isSelected ? 1 : 0,
                      duration: Duration(
                          milliseconds: fadeSpeed ?? AppSize.s250.toInt()),
                      child: child,
                    ),
            ),
          if (titleChild != null) titleChild!,
          if (title != null)
            Row(
              children: [
                AppSize.s8.spaceW,
                CustomText(
                  title!,
                  fontSize: FontSize.f14,
                ),
              ],
            )
        ],
      ),
    );
  }
}
