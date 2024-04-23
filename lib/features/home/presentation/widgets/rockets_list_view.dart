import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mentoship_rockets_discovries_project/core/extensions/extensions.dart';
import 'package:mentoship_rockets_discovries_project/features/home/presentation/widgets/rocket_tile.dart';

import '../../../../core/dependency_injection/dependency_injection.dart';
import '../../../rocket_details/logic/cubit/rocket_cubit.dart';
import '../../../rocket_details/ui/screens/rocket_details.dart';
import '../../Logic/cubit/get_all_rockets_cubit.dart';
import '../../Logic/cubit/get_all_rockets_state.dart';

class RocketsListView extends StatelessWidget {
  const RocketsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllRocketsCubit, GetAllRocketsState>(
      builder: (context, state) {
        return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: RocketTile(
                        onTap: () {
                          print("hello");
                          context.push(
                            BlocProvider(
                              create: (context) => getIt<RocketCubit>()
                                ..getRocketDetailsById(
                                    id: state.allRockets[index].id ?? ''),
                              child: const RocketDetailsPage(),
                            ),
                          );
                        },
                        name: state.allRockets[index].name,
                        date: state.allRockets[index].firstFlight,
                        imageUrl: state.allRockets[index].flickrImages?[0] ??
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRr3rrPWMpfSEm0gtRGCxJ_fmX0IWv3VotMtHnnSIRMYg&s",
                      ),
                    ),
                  ));
            },
            separatorBuilder: (context, index) => SizedBox(height: 10.h),
            itemCount: state.allRockets.length);
      },
    );
  }
}
