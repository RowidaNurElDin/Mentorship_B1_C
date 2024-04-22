import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardPageIndicator extends StatelessWidget {
  const OnboardPageIndicator({super.key, required this.controller, required this.itemCount});

  final PageController controller;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return   SmoothPageIndicator(
      controller: controller,
      count: itemCount,
      effect: WormEffect(
        activeDotColor: Colors.white,
        dotColor: Colors.grey[400]!,
        dotWidth: 8,
        dotHeight: 8,
        spacing: 16,
      ),
    );
  }
}
