import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentoship_rockets_discovries_project/core/extensions/extensions.dart';
import 'package:mentoship_rockets_discovries_project/core/helpers/assets_manager.dart';
import 'package:mentoship_rockets_discovries_project/core/helpers/colors_manager.dart';
import 'package:mentoship_rockets_discovries_project/core/helpers/fonts_manager.dart';
import 'package:mentoship_rockets_discovries_project/core/helpers/values_manager.dart';
import 'package:mentoship_rockets_discovries_project/core/widgets/custom_button.dart';
import 'package:mentoship_rockets_discovries_project/core/widgets/custom_image.dart';
import 'package:mentoship_rockets_discovries_project/core/widgets/custom_text.dart';
import 'package:mentoship_rockets_discovries_project/core/widgets/space.dart';
import 'package:mentoship_rockets_discovries_project/features/onboard/presentation/cubit/onboard_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardCubit onboardCubit = BlocProvider.of(context);
    return Scaffold(
      backgroundColor: ColorsManager.blackLightColor,
      body: Center(
        child:  PageView.builder(
          itemCount: onboardCubit.onboardTitles.length,
            controller: onboardCubit.controller,
            onPageChanged: (index) {
            onboardCubit.changeIndex(index: index);
            },
            itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImage(
                imageUrl: onboardCubit.onboardImages[index],
                // imageUrl: onboardCubit.launcherModel.links!.patch!.small,
              ),
              CustomImage(
                imageAsset: AssetsManager.logo,
                color: ColorsManager.whiteColor,
                width: context.screenWidth / 1.5,
              ),
              SizedBox(
                width: context.screenWidth / 1.4,
                child: CustomText(
                  onboardCubit.onboardTitles[index],
                  color: ColorsManager.whiteColor,
                  fontSize: FontSize.f18,
                ),
              ),
              AppSize.s24.spaceH,
              CustomButton(
                onTap: () {
                  if(onboardCubit.controller.page! < onboardCubit.onboardTitles.length -1 .toDouble()) {
                    onboardCubit.controller.nextPage(duration: const Duration(seconds: 1), curve: Curves.easeIn);
                  }
                  else {
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
                controller: onboardCubit.controller,
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
        }),
      ),
    );
  }
}
