import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RocketTileBackgroundWidget extends StatelessWidget {
  final String imageUrl;
  const RocketTileBackgroundWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: double.infinity,
      foregroundDecoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black])
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover),
      ),
    );
  }
}
