import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/colors_manager.dart';

class ImageZoom extends StatelessWidget {
  const ImageZoom({Key? key, required this.imageUrl, this.onTap})
      : super(key: key);

  final String imageUrl;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: ColorsManager.blackColor.withOpacity(0.5),
        body: GestureDetector(
          onTap: () {
            if (onTap != null) {
              onTap!();
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Center(
              child: InteractiveViewer(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Hero(tag: imageUrl, child: Image.network(imageUrl)),
              )),
            ),
          ),
        ),
      ),
    );
  }
}
