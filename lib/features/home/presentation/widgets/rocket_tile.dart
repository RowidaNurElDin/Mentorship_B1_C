import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mentoship_rockets_discovries_project/features/home/presentation/widgets/rocket_tile_background_image.dart';

class RocketTile extends StatelessWidget {
  final String? date;
  final String? name;
  final String? imageUrl;
  const RocketTile({super.key, this.date, this.name, this.imageUrl});

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
            RocketTileBackgroundWidget(imageUrl: imageUrl!),
            Positioned(
              bottom: 35.h,
              left: 10.w,
              child: Text(
                DateFormat('MMM dd, yyyy')
                    .format(DateTime.parse(date!))
                    .toString(),

                style:GoogleFonts.abel().copyWith(
                  fontSize: 20.sp,
                  color: const Color.fromARGB(255, 94, 157, 208),
                  fontWeight: FontWeight.w600,
                )
              ),
            ),
            Positioned(
              bottom: 5,
              left: 10.w,
              child: Text(
                name!,
                style: GoogleFonts.aBeeZee().copyWith(
                  fontSize: 25.sp,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
