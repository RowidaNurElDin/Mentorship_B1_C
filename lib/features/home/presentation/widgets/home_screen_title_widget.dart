import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenTitleWidget extends StatelessWidget {
  const HomeScreenTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: EdgeInsetsDirectional.only(start: 8.w),
      child: Text(
        "OUR ROCKETS",
        style: TextStyle(
          color: Colors.grey,
          fontSize: 20.sp,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
