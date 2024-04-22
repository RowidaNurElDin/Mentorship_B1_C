import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentoship_rockets_discovries_project/core/extensions/extensions.dart';

class OnboardTitle extends StatelessWidget {
  const OnboardTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth / 1.4,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: GoogleFonts.roboto().copyWith(
            color: Colors.white,
            fontSize: 18.sp,
          fontWeight: FontWeight.w100,
        ),
      ),
    );
  }
}
