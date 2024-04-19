import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentoship_rockets_discovries_project/features/home/Data/remote_data_source/get_all_rockets_data_source.dart';
import 'package:mentoship_rockets_discovries_project/features/home/Logic/cubit/get_all_rockets_cubit.dart';
import 'package:mentoship_rockets_discovries_project/features/home/Logic/cubit/get_all_rockets_state.dart';
import 'package:mentoship_rockets_discovries_project/features/home/presentation/widgets/rocket_tile.dart';

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
    return BlocBuilder<GetAllRocketsCubit, GetAllRocketsState>(
      builder: (context, state) {
        if(state.state == GetRocketsState.success){
             return ListView.separated(
            itemBuilder: (context, index) {
              return RocketTile(
                name: state.allRockets[index].name,
                date: state.allRockets[index].firstFlight,
                imageUrl: state.allRockets[index].flickrImages![0],
                );
            },
            separatorBuilder: (context, index) => SizedBox(height: 10.h),
            itemCount: state.allRockets.length);
        }
        else if(state is Error){
          return Center(child: Text(state.failure!.message!));
        }  
     
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
