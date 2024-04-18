import 'package:flutter/material.dart';
import 'package:flutter/src/services/text_formatter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentoship_rockets_discovries_project/core/helpers/responsive_manager.dart';

import '../../config/theme/themes_manager.dart';
import '../helpers/colors_manager.dart';
import '../helpers/values_manager.dart';
import '../themes/presentation/cubit/theme_cubit.dart';
import 'custom_password_field/text_field_error_cubit.dart';
import 'custom_svg.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextFieldErrorCubit? fieldErrorCubit;
  final double? fieldHeight;
  final bool? filled;
  final Color? fillColor;
  final TextEditingController controller;
  final TextInputType textInputType;
  final Function(String newValue)? onChanged;
  final Widget? leftIcon;
  final String? svgIcon;
  final String? errorText;
  final Widget? rightIcon;
  final String? Function(String? value)? validator;
  final FocusNode? focusNode;
  final TextAlign textAlign;
  final int? maxLength;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final bool? readOnly;
  final bool? enabled;
  final bool? expands;
  final int? maxLines;
  final int? minLines;
  final TextAlignVertical? textAlignVertical;
  final GestureTapCallback? onTap;
  final AutovalidateMode? autovalidateMode;
  final EdgeInsetsGeometry? contentPadding;
  final bool? isDense;
  final List<TextInputFormatter>? inputFormatters;
  final BoxConstraints? constraints;
  final TextStyle? errorStyle;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextInputAction? textInputAction;

  const CustomTextField(
      {Key? key,
      this.hintText,
      this.errorText,
      this.errorStyle,
      this.constraints,
      this.autovalidateMode = AutovalidateMode.onUserInteraction,
      this.maxLength,
      this.focusedBorder,
      this.filled,
      this.contentPadding,
      this.maxLines,
      this.minLines,
      this.expands = false,
      this.readOnly = false,
      this.enabled = true,
      this.onTap,
      this.textAlignVertical,
      this.fillColor,
      this.border,
      this.textAlign = TextAlign.start,
      this.rightIcon,
      this.focusNode,
      required this.controller,
      required this.textInputType,
      this.onChanged,
      this.leftIcon,
      this.validator,
      this.isDense,
      this.svgIcon,
      this.inputFormatters = const [],
      this.fontSize,
      this.color,
      this.fontWeight,
      this.fieldHeight = 44,
      this.fieldErrorCubit,
      this.textInputAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeCubit>().state;

    return BlocProvider(
      create: (context) => fieldErrorCubit ?? TextFieldErrorCubit(),
      child: BlocBuilder<TextFieldErrorCubit, TextFieldErrorState>(
        builder: (context, state) {
          final textFieldErrorCubit = context.read<TextFieldErrorCubit>();

          return Material(
            color: ColorsManager.transparent,
            borderRadius: BorderRadius.circular(BorderValues.b8.rc),
            child: Container(
              height:
                  state == TextFieldErrorState.hasError ? 54.h : fieldHeight?.h,
              child: TextFormField(
                buildCounter: (
                  context, {
                  required currentLength,
                  required isFocused,
                  maxLength,
                }) =>
                    null,
                enableSuggestions: false,
                autocorrect: false,
                maxLength: maxLength,
                readOnly: readOnly!,
                enabled: enabled ?? true,
                minLines: minLines,
                maxLines: maxLines,
                textAlignVertical: textAlignVertical,
                expands: expands!,
                autovalidateMode: autovalidateMode,
                onTap: onTap,
                inputFormatters: inputFormatters,
                textAlign: textAlign,
                controller: controller,
                validator: (value) {
                  final String? error = validator?.call(value);

                  if (error != null) {
                    textFieldErrorCubit.setError();
                  } else {
                    textFieldErrorCubit.clearError();
                  }

                  return error;
                },
                keyboardType: textInputType,
                cursorColor: ColorsManager.primaryColor,
                onChanged: onChanged,
                textInputAction: textInputAction,
                focusNode: focusNode,
                style: ThemesManager.blackWhiteRegular16(context).copyWith(
                  color: color ??
                      (themeState == ThemeMode.light
                          ? ColorsManager.greyDarkColor
                          : ColorsManager.whiteExtraColor),
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
                decoration: InputDecoration(
                  errorText: errorText,
                  errorStyle: errorStyle,
                  constraints: constraints,
                  isDense: isDense,
                  filled: filled,
                  fillColor: fillColor,
                  border: border,
                  focusedBorder: focusedBorder,
                  enabledBorder: border,
                  suffixIcon: rightIcon,
                  contentPadding: contentPadding,
                  prefixIcon: leftIcon ??
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
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
