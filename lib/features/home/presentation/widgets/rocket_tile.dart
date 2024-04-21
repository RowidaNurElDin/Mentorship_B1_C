
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class RocketTile extends StatelessWidget {
  final String? date;
  final String? name;
  final String? imageUrl;
  const RocketTile({super.key, this.date , this.name, this.imageUrl});

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
            image: DecorationImage(
            image: NetworkImage(imageUrl!),
             fit: BoxFit.cover),
          ),
        ),
         Positioned(
          bottom: 35.h,
          left: 10.w,
          child: Text(
            ''
          // DateFormat('MMM dd, yyyy').format(DateTime.parse(date!)).toString()
            , style: TextStyle(
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
            name!, style: TextStyle(
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
