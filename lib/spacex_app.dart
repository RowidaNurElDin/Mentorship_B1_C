import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentoship_rockets_discovries_project/features/home/presentation/screens/home_screen.dart';

class SpacexApp extends StatelessWidget {
  const SpacexApp({super.key});

  @override
  Widget build(BuildContext context) {
      return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,

      leadingWidth: 200,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset(
              'assets/images/spacexlogo.png',),
          ),
        ),
        backgroundColor: Colors.black,
        body: const HomrScreen(),
      ),
    );
 
  }
}