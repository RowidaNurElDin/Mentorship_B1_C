import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentoship_rockets_discovries_project/features/home/Logic/cubit/get_all_rockets_cubit.dart';
import 'package:mentoship_rockets_discovries_project/features/home/Logic/cubit/get_all_rockets_state.dart';
import 'package:mentoship_rockets_discovries_project/features/home/presentation/widgets/home_screen_title_widget.dart';
import 'package:mentoship_rockets_discovries_project/features/home/presentation/widgets/rocket_tile.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mentoship_rockets_discovries_project/features/home/presentation/widgets/rockets_list_view.dart';
import '../../../../core/helpers/assets_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomrScreenState();
}

class _HomrScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetAllRocketsCubit>().getAllRockets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leadingWidth: 200,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset(AssetsManager.logo),
        ),
      ),
      backgroundColor: Colors.black,
      body: BlocBuilder<GetAllRocketsCubit, GetAllRocketsState>(
        builder: (context, state) {
          if (state.state == GetRocketsState.success) {
            return  SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomeScreenTitleWidget(),
                    SizedBox(height: 20.h),
                    const RocketsListView(),
                  ],
                ),
            );
          } else if (state.state == GetRocketsState.error) {
            return Center(child: Text(state.failure!.message!));
          }
          return const Center(child: CircularProgressIndicator(color: Colors.white,));
        },
      ),
    );
  }
}
