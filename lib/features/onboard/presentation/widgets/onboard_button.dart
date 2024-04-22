import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardButton extends StatelessWidget {
  OnboardButton({super.key, required this.onTap, required this.title});

  final Function() onTap;
  String title = '';

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: SizedBox(
        width: 80.w,
        height: 48,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              title,
              style: GoogleFonts.roboto().copyWith(
                fontSize: 20,
                  color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Icon(
              Icons.arrow_forward,
              color: Colors.black,
              fill: .9,
              weight: 100,
            ),
          ],
        ),
      ),
    );
  }
}
