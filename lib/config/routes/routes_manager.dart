// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mentoship_rockets_discovries_project/config/routes/routes.dart';
import 'package:mentoship_rockets_discovries_project/features/onboard/presentation/screens/onboard_screen.dart';
import '../../core/helpers/colors_manager.dart';
import '../../core/helpers/strings_manager.dart';
import '../../core/utils/functions.dart';
import '../../features/onboard/presentation/screens/splash_screen.dart';

class RoutesManager {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    late Widget screen;

    switch (settings.name) {
      case Routes.splashScreen:
        screen = const SplashScreen();
        break;

      case Routes.boardingScreen:
        // initBoardingModule();
        screen = OnBoardScreen();
          // index: settings.arguments as int,
        break;

      default:
        screen = _undefinedRouteScreen();
        break;
    }

    return PageRouteBuilder(
      settings: settings,
      transitionDuration: const Duration(milliseconds: 400),
      reverseTransitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          SlideTransition(
              position: Tween<Offset>(
                      begin: Offset(
                         -1,
                          0),
                      end: Offset.zero)
                  .animate(animation),
              child: child),
    );
  }

  static Widget _undefinedRouteScreen() {
    return const Scaffold(
      backgroundColor: ColorsManager.redColor,
      body: Center(
        child: Text(StringsManager.undefinedRoute),
      ),
    );
  }
}
