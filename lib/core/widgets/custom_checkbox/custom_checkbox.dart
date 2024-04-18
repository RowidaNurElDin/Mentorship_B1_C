import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentoship_rockets_discovries_project/core/helpers/responsive_manager.dart';
import 'package:mentoship_rockets_discovries_project/core/widgets/space.dart';
import '../../helpers/assets_manager.dart';
import '../../helpers/colors_manager.dart';
import '../../helpers/fonts_manager.dart';
import '../../helpers/values_manager.dart';
import '../../utils/functions.dart';
import '../custom_button.dart';
import '../custom_svg.dart';
import '../custom_text.dart';
import 'checkbox_cubit.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    Key? key,
    required this.onChange,
    this.onCreate,
    required this.title,
    this.boxShape,
    this.child,
    this.fadeSpeed,
    this.isChecked = false,
    this.boxWidth,
    this.boxHeight,
    this.backGroundColor,
  }) : super(key: key);

  final Function(bool state) onChange;
  final bool isChecked;
  final Function(BuildContext context)? onCreate;
  final String? title;
  final BoxShape? boxShape;
  final Widget? child;
  final int? fadeSpeed;
  final double? boxHeight;
  final double? boxWidth;
  final Color? backGroundColor;

  @override
  Widget build(BuildContext context) {
    print('are we rebuilded');
    return BlocProvider(
      create: (context) => CheckboxCubit(startWith: isChecked),
      child: BlocBuilder<CheckboxCubit, bool>(
        builder: (context, state) {
          //This on create is only for mashrak app
          print('is chedk $isChecked  $state}');

          if (onCreate != null) {
            onCreate!(context);
          }
          return CustomButton(
            wPadding: PaddingValues.zero,
            hPadding: PaddingValues.zero,
            transparentButton: true,
            onTap: () {
              print('are we taped here');
              onChange(!state);
              BlocProvider.of<CheckboxCubit>(context).changeState();
            },
            child: Row(
              children: [
                AnimatedContainer(
                  duration:
                      Duration(milliseconds: fadeSpeed ?? AppSize.s250.toInt()),
                  width: state ? null : boxWidth ?? AppSize.s20.rs,
                  height: state ? null : boxHeight ?? AppSize.s20.rs,
                  decoration: state
                      ? null
                      : BoxDecoration(
                          border: Border.all(
                              width: AppSize.s1.rs,
                              color: getLocaleColorFrom(
                                  context: context,
                                  light:
                                  ColorsManager.greyExtraLightColor200,
                                  dark: ColorsManager.greySemiBoldColor600)!,),
                          shape: BoxShape.circle,
                          color: child == null
                              ? state
                                  ? ColorsManager.primaryColor
                                  : backGroundColor ?? ColorsManager.whiteColor
                              : backGroundColor ?? ColorsManager.whiteColor,
                        ),
                  child: child == null
                      ? state
                          ? CustomSvg(AssetsManager.checkboxAcceptedIcon)
                          : null
                      : AnimatedOpacity(
                          opacity: state ? 1 : 0,
                          duration: Duration(
                              milliseconds: fadeSpeed ?? AppSize.s250.toInt()),
                          child: child,
                        ),
                ),
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
        },
      ),
    );
  }
}

class CustomEditCheckBox extends StatelessWidget {
  const CustomEditCheckBox({
    Key? key,
    required this.onChange,
    this.onCreate,
    required this.title,
    this.boxShape,
    this.child,
    this.fadeSpeed,
    this.isChecked = false,
    this.boxWidth,
    this.boxHeight,
    this.backGroundColor,
  }) : super(key: key);

  final Function(bool state) onChange;
  final bool isChecked;
  final Function(BuildContext context)? onCreate;
  final String? title;
  final BoxShape? boxShape;
  final Widget? child;
  final int? fadeSpeed;
  final double? boxHeight;
  final double? boxWidth;
  final Color? backGroundColor;

  @override
  Widget build(BuildContext context) {
    print('are we rebuilded');
    final checkBoxCubit = CheckboxCubit(startWith: isChecked);
    return BlocBuilder<CheckboxCubit, bool>(
      bloc: checkBoxCubit,
      builder: (context, state) {
        return CustomButton(
          wPadding: PaddingValues.zero,
          hPadding: PaddingValues.zero,
          transparentButton: true,
          onTap: () {
            print('are we taped here');
            onChange(!state);
            checkBoxCubit.changeState();
          },
          child: Row(
            children: [
              AnimatedContainer(
                duration:
                    Duration(milliseconds: fadeSpeed ?? AppSize.s250.toInt()),
                width: state ? null : boxWidth ?? AppSize.s20.rs,
                height: state ? null : boxHeight ?? AppSize.s20.rs,
                decoration: state
                    ? null
                    : BoxDecoration(
                  border: Border.all(
                    width: AppSize.s1.rs,
                    color: getLocaleColorFrom(
                        context: context,
                        light:
                        ColorsManager.greyExtraLightColor200,
                        dark: ColorsManager.greySemiBoldColor600)!,),

                  shape: BoxShape.circle,
                        color: child == null
                            ? state
                                ? ColorsManager.primaryColor
                                : backGroundColor ?? ColorsManager.whiteColor
                            : backGroundColor ?? ColorsManager.whiteColor,
                      ),
                child: child == null
                    ? state
                        ? CustomSvg(AssetsManager.checkboxAcceptedIcon)
                        : null
                    : AnimatedOpacity(
                        opacity: state ? 1 : 0,
                        duration: Duration(
                            milliseconds: fadeSpeed ?? AppSize.s250.toInt()),
                        child: child,
                      ),
              ),
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
      },
    );
  }
}
