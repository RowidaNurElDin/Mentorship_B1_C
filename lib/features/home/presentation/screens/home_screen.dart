import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentoship_rockets_discovries_project/features/home/presentation/widgets/rocket_tile.dart';

class HomrScreen extends StatelessWidget {
  const HomrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context,index){
        return const RocketTile();
      },
       separatorBuilder: (context, index) => SizedBox(height: 10.h),
       itemCount: 5);
  }
}