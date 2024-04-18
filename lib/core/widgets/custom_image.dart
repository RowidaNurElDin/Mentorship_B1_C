import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../helpers/assets_manager.dart';
import '../helpers/colors_manager.dart';
import '../helpers/values_manager.dart';
import 'loading.dart';

class CustomImage extends StatelessWidget {
  final Color? loadingColor;
  final String? imageUrl;
  final String? imageAsset;
  final File? imageFile;
  final double? border;
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;
  final BoxFit? fit;
  const CustomImage({
    Key? key,
    this.loadingColor,
    this.imageUrl,
    this.imageAsset,
    this.imageFile,
    this.border,
    this.borderRadius,
    this.width,
    this.height,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
          borderRadius ?? BorderRadius.circular(border ?? BorderValues.b10),
      child: _getImage(),
    );
  }

  Widget _getImage() {
    if (imageFile != null) {
      return Image.file(
        imageFile!,
        height: height,
        width: width,
        fit: fit ?? BoxFit.fill,
        errorBuilder: (BuildContext context, Object object, StackTrace? track) {
          return Image.asset(
            AssetsManager.placeholder,
            height: height,
            width: width,
            fit: fit ?? BoxFit.fill,
          );
        },
      );
    } else if (imageUrl != null) {
      return imageUrl!.contains('svg')
          ? SvgPicture.network(
              imageUrl!,
              height: height,
              width: width,
              fit: fit ?? BoxFit.fill,
            )
          : Image.network(
              imageUrl!,
              height: height,
              width: width,
              fit: fit ?? BoxFit.fill,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;

                return Container(
                  width: width,
                  height: height,
                  alignment: Alignment.center,
                  child: CustomLoading(
                    color: loadingColor ?? ColorsManager.primaryColor,
                  ),
                );
              },
              errorBuilder:
                  (BuildContext context, Object object, StackTrace? track) {
                return Image.asset(
                  AssetsManager.placeholder,
                  height: height,
                  width: width,
                  fit: fit ?? BoxFit.fill,
                );
              },
            );
    }

    return Image.asset(
      imageAsset!,
      height: height,
      width: width,
      fit: fit ?? BoxFit.fill,
      errorBuilder: (BuildContext context, Object object, StackTrace? track) {
        return Image.asset(
          AssetsManager.placeholder,
          height: height,
          width: width,
          fit: fit ?? BoxFit.fill,
        );
      },
    );
  }
}
