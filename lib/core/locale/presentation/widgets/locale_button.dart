import 'package:flutter/material.dart';
import '../../../helpers/colors_manager.dart';
import '../../../helpers/values_manager.dart';
import '../../../widgets/custom_button.dart';
import '../cubit/locale_cubit.dart';

class LocaleButton extends StatelessWidget {
  final double? hMargin;
  final double? wMargin;
  final Color? backGroundColor;
  final Color? foreground;
  const LocaleButton(
      {Key? key,
      this.hMargin,
      this.wMargin,
      this.backGroundColor,
      this.foreground})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
        hMargin: hMargin ?? PaddingValues.p10,
        wMargin: wMargin ?? PaddingValues.p10,
        hPadding: PaddingValues.zero,
        wPadding: PaddingValues.zero,
        transparentButton: true,
        shape: BoxShape.circle,
        onTap: () {
          LocaleCubit.get(context).changeCurrentLang();
        },
        child: const Icon(
          Icons.language,
          color: ColorsManager.whiteColor,
        ));
  }
}
