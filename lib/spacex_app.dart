import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentoship_rockets_discovries_project/core/helpers/assets_manager.dart';
import 'package:mentoship_rockets_discovries_project/features/onboard/presentation/screens/onboard_screen.dart';

class SpacexApp extends StatelessWidget {
  const SpacexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: OnBoardScreen(),
    );
  }
}