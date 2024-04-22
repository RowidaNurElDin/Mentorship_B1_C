import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenTitleWidget extends StatelessWidget {
  const HomeScreenTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: EdgeInsetsDirectional.only(start: 8.w),
      child: Text(
        "OUR ROCKETS",
        style: GoogleFonts.aboreto().copyWith(
          fontSize: 20.sp,
          color:Colors.grey,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
