import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentoship_rockets_discovries_project/core/extensions/extensions.dart';
import 'package:mentoship_rockets_discovries_project/features/onboard/presentation/widgets/logo.dart';
import 'package:mentoship_rockets_discovries_project/features/onboard/presentation/widgets/onboard_button.dart';
import 'package:mentoship_rockets_discovries_project/features/onboard/presentation/widgets/onboard_image.dart';
import 'package:mentoship_rockets_discovries_project/features/onboard/presentation/widgets/onboard_page_indicator.dart';
import 'package:mentoship_rockets_discovries_project/features/onboard/presentation/widgets/onboard_title.dart';
import '../../../../core/dependency_injection/dependency_injection.dart';
import '../../../home/Logic/cubit/get_all_rockets_cubit.dart';
import '../../../home/presentation/screens/home_screen.dart';

//ignore: must_be_immutable
class OnBoardScreen extends StatelessWidget {
  OnBoardScreen({super.key});

  int currentIndex = 0;
  final PageController controller = PageController();

  List<String> onboardTitles = [
    'Explore SpaceX launches: past and future!',
    'Discover SpaceX\'s rocket launches now!',
    'Explore SpaceX\'s rocket launches today!',
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
      backgroundColor: Colors.black,
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
                OnboardImage(image: onboardImages[index]),
               SizedBox(
                 height: 16.h,
               ),
               const Logo(),
                SizedBox(
                  height: 16.h,
                ),
                OnboardTitle(title: onboardTitles[index],),
                const SizedBox(
                  height: 24,
                ),
                OnboardButton(
                  onTap: () {
                    if (controller.page! <
                        onboardTitles.length - 1.toDouble()) {
                      controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    } else {
                      context.push(
                        BlocProvider(
                          create: (context) => getIt<GetAllRocketsCubit>(),
                          child: const HomeScreen(),
                        ),
                      );
                    }
                  },
                  title: index == onboardTitles.length -1 ? 'Start' : 'Next',
                ),
                SizedBox(
                  height: 32.h,
                ),
                OnboardPageIndicator(controller: controller, itemCount: onboardTitles.length),
              ],
            );
          },
        ),
      ),
    );
  }
}
