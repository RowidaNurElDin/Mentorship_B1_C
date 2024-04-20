import 'package:flutter/material.dart';
import 'package:mentoship_rockets_discovries_project/core/extensions/extensions.dart';
import 'package:mentoship_rockets_discovries_project/core/helpers/assets_manager.dart';
import 'package:mentoship_rockets_discovries_project/core/helpers/colors_manager.dart';
import 'package:mentoship_rockets_discovries_project/core/helpers/fonts_manager.dart';
import 'package:mentoship_rockets_discovries_project/core/helpers/values_manager.dart';
import 'package:mentoship_rockets_discovries_project/core/widgets/custom_button.dart';
import 'package:mentoship_rockets_discovries_project/core/widgets/custom_image.dart';
import 'package:mentoship_rockets_discovries_project/core/widgets/custom_text.dart';
import 'package:mentoship_rockets_discovries_project/core/widgets/space.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardScreen extends StatelessWidget {
  OnBoardScreen({super.key});


  int currentIndex = 0;
  final PageController controller = PageController();

  List<String> onboardTitles = [
    'Discover all upcoming and past rockets launching of SpaceX',
    'Discover all upcoming and past rockets launching of SpaceX',
    'Discover all upcoming and past rockets launching of SpaceX',
  ];
  List<String> onboardImages = [
    'https://imgur.com/azYafd8.jpg',
    'https://farm4.staticflickr.com/3955/32915197674_eee74d81bb_b.jpg',
    'https://farm5.staticflickr.com/4599/38583829295_581f34dd84_b.jpg'

  ];

  changeIndex({required int index}) {
    currentIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.blackLightColor,
      body: Center(
        child: PageView.builder(
          itemCount: onboardTitles.length,
          controller: controller,
          onPageChanged: (index) {
            changeIndex(index: index);
          },
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImage(
                  imageUrl: onboardImages[index],
                  // imageUrl: //     .launcherModel.links!.patch!.small,
                ),
                CustomImage(
                  imageAsset: AssetsManager.logo,
                  color: ColorsManager.whiteColor,
                  width: context.screenWidth / 1.5,
                ),
                SizedBox(
                  width: context.screenWidth / 1.4,
                  child: CustomText(
                    onboardTitles[index],
                    color: ColorsManager.whiteColor,
                    fontSize: FontSize.f18,
                  ),
                ),
                AppSize.s24.spaceH,
                CustomButton(
                  onTap: () {
                    if (controller.page! <
                        onboardTitles.length -
                            1.toDouble()) {
                      controller.nextPage(
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeIn);
                    } else {
                      // context.push(HomeScreen());
                    }
                  },
                  text: 'Start',
                  color: ColorsManager.whiteColor,
                  textColor: ColorsManager.blackColor,
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: ColorsManager.blackColor,
                  ),
                ),
                AppSize.s48.spaceH,
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: const WormEffect(
                    activeDotColor: ColorsManager.whiteColor,
                    dotColor: ColorsManager.greyLightColor400,
                    dotWidth: 6,
                    dotHeight: 6,
                    spacing: 16,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
