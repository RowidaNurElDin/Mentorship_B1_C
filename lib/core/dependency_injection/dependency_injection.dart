

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mentoship_rockets_discovries_project/core/networking/dio_factory.dart';
import 'package:mentoship_rockets_discovries_project/core/networking/rockets_networking/rocket_service.dart';
import 'package:mentoship_rockets_discovries_project/features/home/Data/remote_data_source/get_all_rockets_data_source.dart';
import 'package:mentoship_rockets_discovries_project/features/home/Logic/cubit/get_all_rockets_cubit.dart';

import '../networking/rockets_networking/rocket_provider.dart';
import '../networking/api_service.dart';

final getIt = GetIt.instance;

Future<void> setUpDependencyInjections() async{
  DioFactory.getDio();
  //getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => InternetConnectionChecker());
  getIt.registerFactory(() => GetAllRocketsRepository());
  getIt.registerLazySingleton(() => RocketProvider(DioFactory.getDio()));
  getIt.registerLazySingleton(() => RocketService(rocketProvider: getIt<RocketProvider>()));
  getIt.registerFactory(() => GetAllRocketsCubit(getIt<GetAllRocketsRepository>(), getIt<RocketService>()));
}


