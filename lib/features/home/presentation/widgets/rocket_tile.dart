import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RocketTile extends StatelessWidget {
  const RocketTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO : Naviga
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Stack(
          children: [
            Container(
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
            image: const DecorationImage(
            image: AssetImage('assets/images/rockets.jpg'),
             fit: BoxFit.cover),
          ),
        ),
         Positioned(
          bottom: 50.h,
          left: 10.w,
          child: Text(
            "Date here", style: TextStyle(
              fontSize: 20.sp,
              color: Color.fromARGB(255, 94, 157, 208),
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        
        Positioned(
          bottom: 5,
          left: 10.w,
          child: Text(
            "ROCKET NAME", style: TextStyle(
              fontSize: 25.sp,
              color: Colors.white
            ),
          ),
        )
          ],
        ),
      ),
    );

  }
}
