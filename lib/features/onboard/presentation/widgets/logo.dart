import 'package:flutter/material.dart';
import 'package:mentoship_rockets_discovries_project/core/extensions/extensions.dart';

import '../../../../core/helpers/assets_manager.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth / 1.7,
      child: Image.asset(
        AssetsManager.logo,
      ),
    );
  }
}
