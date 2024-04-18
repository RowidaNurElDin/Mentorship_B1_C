import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentoship_rockets_discovries_project/core/helpers/responsive_manager.dart';
import 'package:mentoship_rockets_discovries_project/core/widgets/custom_password_field/password_field_error_cubit.dart';
import '../../helpers/assets_manager.dart';
import '../../helpers/colors_manager.dart';
import '../../helpers/fonts_manager.dart';
import '../../helpers/values_manager.dart';
import '../../themes/presentation/cubit/theme_cubit.dart';
import '../custom_button.dart';
import '../custom_svg.dart';
import '/config/theme/themes_manager.dart';
import 'text_field_cubit.dart';

class CustomPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final Widget? icon;
  final String? svgIcon;
  final double? fontSize;
  final Color? color;

  final Function(String newValue)? onChanged;
  final String? Function(String?)? validator;
  final PasswordTextFieldErrorCubit fieldErrorCubit;
  final double? fieldHeight;

  const CustomPasswordField(
      {Key? key,
      required this.controller,
      this.hintText,
      this.icon,
      this.onChanged,
      this.validator,
      this.svgIcon,
      this.fontSize,
      this.color,
      required this.fieldErrorCubit,
      this.fieldHeight = 44})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeCubit>().state;

    return BlocProvider.value(
      value: fieldErrorCubit,
      child: BlocBuilder<PasswordTextFieldErrorCubit, int>(
        builder: (context, errorState) {
          final textFieldErrorCubit =
              context.read<PasswordTextFieldErrorCubit>();

          return BlocProvider(
            create: (context) => TextFieldCubit(),
            child: BlocBuilder<TextFieldCubit, bool>(
              builder: (context, state) {
                return Container(
                  height: textFieldErrorCubit.noError == false
                      ? 54.h
                      : fieldHeight?.h,
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: state,
                    controller: controller,
                    validator: validator,
                    enableSuggestions: false,
                    keyboardType: TextInputType.visiblePassword,
                    cursorColor: ColorsManager.primaryColor,
                    textAlignVertical: TextAlignVertical.center,

                    onChanged: onChanged,
                    style: ThemesManager.blackWhiteRegular16(context).copyWith(
                      color: color ??
                          (themeState == ThemeMode.light
                              ? ColorsManager.greyDarkColor
                              : ColorsManager.whiteExtraColor),
                      fontSize: fontSize ?? FontSize.f16.sp,
                    ),
                    decoration: InputDecoration(
                        prefixIcon: icon ??
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
                        suffixIcon: CustomButton(
                          color: ColorsManager.transparent,
                          shape: BoxShape.circle,
                          onTap: () => BlocProvider.of<TextFieldCubit>(context)
                              .changeState(),
                          child: CustomSvg(
                            state
                                ? AssetsManager.eyeOpenIcon
                                : AssetsManager.eyeClosedIcon,
                            color: (themeState == ThemeMode.light
                                ? ColorsManager.greyMediumColor500
                                : ColorsManager.lightBlueColor),
                          ),
                        )),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
