import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentoship_rockets_discovries_project/core/helpers/responsive_manager.dart';


class CustomSvg extends StatelessWidget {
  final String path;
  final num? size;
  final Color? color;
  final BoxFit? fit;

  const CustomSvg(this.path, {super.key, this.size, this.color, this.fit});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path, width: size!.rf,
      height: size?.rs,
      // ignore: deprecated_member_use
      color: color,
      fit: fit ?? BoxFit.none,
      theme: SvgTheme(currentColor: Colors.red),
    );
  }
}
