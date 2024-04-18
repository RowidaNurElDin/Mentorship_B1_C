import 'package:flutter/material.dart';
import 'package:mentoship_rockets_discovries_project/core/helpers/responsive_manager.dart';
import '../helpers/colors_manager.dart';
import '../helpers/values_manager.dart';
import 'custom_button.dart';


class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: () {
        Navigator.pop(context);
      },
      hPadding: PaddingValues.p15.rs,
      wPadding: PaddingValues.p15.rs,
      isFilled: false,
      radius: BorderValues.b15.rc,
      color: const Color(0xffE8ECF4),
      child: const RotatedBox(
          quarterTurns: 2,
          child: Icon(
            Icons.arrow_forward_ios,
            color: ColorsManager.blackColor,
          )),
    );
  }
}
