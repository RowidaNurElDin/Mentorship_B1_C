import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentoship_rockets_discovries_project/features/rocket_details/logic/cubit/rocket_cubit.dart';
import 'package:mentoship_rockets_discovries_project/features/rocket_details/rocket_provider.dart';
import 'package:mentoship_rockets_discovries_project/features/rocket_details/rocket_service.dart';

import 'features/rocket_details/ui/screens/rocket_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    dio.options.baseUrl = "https://api.spacexdata.com/v4";
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => RocketCubit(
            rocketService: RocketService(
                rocketProvider: RocketProvider(dio,
                    baseUrl: "https://api.spacexdata.com/v4"))),
        // Initialize your cubit here
        child: const RocketDetailsPage(),
      ),
    );
  }
}
