import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentoship_rockets_discovries_project/features/onboard/presentation/screens/onboard_screen.dart';
import 'core/helpers/strings_manager.dart';

class SpacexApp extends StatelessWidget {
  const SpacexApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      builder: (context, child) => child!,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: StringsManager.appName,
          home: OnBoardScreen(),
      ),
    );
  }
}
