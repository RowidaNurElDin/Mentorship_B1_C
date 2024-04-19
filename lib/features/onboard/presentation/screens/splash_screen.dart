import 'package:flutter/material.dart';
import 'package:mentoship_rockets_discovries_project/core/extensions/extensions.dart';
import 'package:mentoship_rockets_discovries_project/core/helpers/colors_manager.dart';
import 'package:mentoship_rockets_discovries_project/core/widgets/custom_text.dart';
import 'package:mentoship_rockets_discovries_project/features/onboard/presentation/screens/onboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), (){
      context.push(const OnBoardScreen());
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CustomText('Splash', color: ColorsManager.softBlueColor,),),
    );
  }
}
