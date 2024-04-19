

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mentoship_rockets_discovries_project/core/networking/dio_factory.dart';

import '../networking/api_service.dart';

final getIt = GetIt.instance;

Future<void> setUpDependencyInjections() async{
  getIt.registerLazySingleton<ApiService>(() => ApiService());
  getIt.registerLazySingleton(() => InternetConnectionChecker());
}


