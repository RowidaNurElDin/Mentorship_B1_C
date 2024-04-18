import 'package:flutter/material.dart';
import 'package:mentoship_rockets_discovries_project/core/helpers/responsive_manager.dart';
import 'package:mentoship_rockets_discovries_project/core/widgets/space.dart';

import '../../config/theme/themes_manager.dart';
import '../helpers/assets_manager.dart';
import '../helpers/colors_manager.dart';
import '../helpers/strings_manager.dart';
import '../helpers/values_manager.dart';
import '../utils/functions.dart';
import 'custom_button.dart';
import 'custom_svg.dart';
import 'custom_text.dart';

class CustomErrorWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String? error;
  final bool? isRequired;
  const CustomErrorWidget({
    Key? key,
    required this.onTap,
    this.error,
    this.isRequired,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: PaddingValues.pDefault.rw,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Center(
                child: CustomSvg(
                  AssetsManager.alertIcon,
                  size: AppSize.s350.rs,
                  color: ColorsManager.redColor,
                ),
              ),
              AppSize.s50.spaceH,
              CustomText(
                'Error',
                textStyle: ThemesManager.blackWhiteRegular18(context),
              ),
            ],
          ),
          AppSize.s15.spaceH,
          if (isRequired != true) ...[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: CustomText(
                      error ?? '',
                      textStyle: ThemesManager.blackWhiteRegular12(context),
                    ),
                  ),
                  AppSize.s50.spaceH,
                  CustomButton(
                    onTap: onTap,
                    text: getLocaleString(StringsManager.tryAgain, context),
                  ),
                ],
              ),
            )
          ] else ...[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomText(
                  error ?? '',
                  textStyle: ThemesManager.blackWhiteRegular12(context),
                ),
                AppSize.s50.spaceH,
                CustomButton(
                  onTap: onTap,
                  text: getLocaleString(StringsManager.tryAgain, context),
                ),
              ],
            )
          ],
          AppSize.s25.spaceH,
        ],
      ),
    );
  }
}
