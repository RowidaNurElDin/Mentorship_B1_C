import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../helpers/assets_manager.dart';
import '../helpers/colors_manager.dart';
import '../locale/presentation/cubit/locale_cubit.dart';
import 'custom_svg.dart';

class CustomBackArrow extends StatelessWidget {
  const CustomBackArrow({
    Key? key,
    this.color,
    required this.onTap,
  }) : super(key: key);

  final Color? color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, state) {
          return Container(
            child: LocaleCubit.get(context).state.languageCode == 'en'
                ? Transform.rotate(
                    angle: -3.15,
                    child: CustomSvg(
                      AssetsManager.arrowBack,
                      color: color ?? ColorsManager.whiteColor,
                    ),
                  )
                : CustomSvg(
                    AssetsManager.arrowBack,
                    color: color ?? ColorsManager.whiteColor,
                  ),
          );
        },
      ),
    );
  }
}
