import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mentoship_rockets_discovries_project/features/onboard/presentation/cubit/onboard_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/cache/cache_consumer.dart';
import 'core/cache/cache_consumer_impl.dart';
import 'core/locale/data/datasources/lang_local_datasource.dart';
import 'core/locale/data/repositories/lang_repository_impl.dart';
import 'core/locale/domain/repositories/lang_repository.dart';
import 'core/locale/domain/usecases/change_locale.dart';
import 'core/locale/domain/usecases/get_saved_lang.dart';
import 'core/locale/presentation/cubit/locale_cubit.dart';
import 'core/networking/api_consumer.dart';
import 'core/networking/app_interceptor.dart';
import 'core/networking/dio_consumer.dart';
import 'core/networking/endpoints.dart';
import 'core/networking/network_info.dart';
import 'core/themes/data/datasources/theme_local_datasource.dart';
import 'core/themes/data/repositories/theme_repository_impl.dart';
import 'core/themes/domain/repositories/theme_repository.dart';
import 'core/themes/domain/usecases/change_theme.dart';
import 'core/themes/domain/usecases/get_saved_theme.dart';
import 'core/themes/presentation/cubit/theme_cubit.dart';
import 'features/onboard/data/datasources/boarding_datasource.dart';
import 'features/onboard/data/repositories/boarding_repository_impl.dart';
import 'features/onboard/domain/repositories/boarding_repository.dart';
import 'features/onboard/domain/usecases/get_boarding_usecase.dart';


final diInstance = GetIt.instance;

Future<void> initAppModule() async {
  //! Features
  initThemeModule();
  initLocaleModule();
  initBoardingModule();

  //! Core
  diInstance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: diInstance()));
  diInstance.registerLazySingleton<ApiConsumer>(() => DioConsumer(
      dio: diInstance(),
      baseUrl: EndPoints.baseUrl,
      appInterceptors: diInstance(),
      cacheConsumer: diInstance()));
  diInstance.registerLazySingleton<CacheConsumer>(
      () => CacheConsumerImpl(sharedPreferences: diInstance()));
  //!External
  final sharedPreferences = await SharedPreferences.getInstance();
  diInstance.registerLazySingleton(() => sharedPreferences);

  diInstance.registerLazySingleton(() => Dio());
  diInstance.registerLazySingleton(() => AppInterceptors(diInstance()));
  diInstance.registerLazySingleton(() => LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ));
  diInstance.registerLazySingleton(() => InternetConnectionChecker());
}

Future<void> initThemeModule() async {
  //?Cubits
  diInstance.registerFactory<ThemeCubit>(() => ThemeCubit(
      getSavedThemeUseCase: diInstance(), changeThemeUseCase: diInstance()));

  //?Use cases
  diInstance.registerLazySingleton<GetSavedThemeUseCase>(
      () => GetSavedThemeUseCase(themeRepository: diInstance()));
  diInstance.registerLazySingleton<ChangeThemeUseCase>(
      () => ChangeThemeUseCase(themeRepository: diInstance()));

  //?Repositories
  diInstance.registerLazySingleton<ThemeRepository>(
      () => ThemeRepositoryImpl(themeLocalDataSource: diInstance()));

  //?Data Sources
  diInstance.registerLazySingleton<ThemeLocalDataSource>(
      () => ThemeLocalDataSourceImpl(cacheConsumer: diInstance()));
}

Future<void> initLocaleModule() async {
  //?Cubits
  diInstance.registerFactory<LocaleCubit>(() => LocaleCubit(
      getSavedLangUseCase: diInstance(), changeLocaleUseCase: diInstance()));

  //?Use cases
  diInstance.registerLazySingleton<GetSavedLangUseCase>(
      () => GetSavedLangUseCase(localeRepository: diInstance()));
  diInstance.registerLazySingleton<ChangeLocaleUseCase>(
      () => ChangeLocaleUseCase(localeRepository: diInstance()));

  //?Repositories
  diInstance.registerLazySingleton<LocaleRepository>(
      () => LocaleRepositoryImpl(localeLocalDataSource: diInstance()));

  //?Data Sources
  diInstance.registerLazySingleton<LocaleLocalDataSource>(
      () => LocaleLocalDataSourceImpl(cacheConsumer: diInstance()));
}

Future<void> initBoardingModule() async {
  if (diInstance.isRegistered<BoardingDataSource>()) return;

  diInstance.registerFactory<OnboardCubit>(() => OnboardCubit(
    diInstance(),
    diInstance(),
  ));

  // Use cases
  diInstance.registerLazySingleton<GetBoardingUsecase>(
      () => GetBoardingUsecase(diInstance()));

  // Repositories
  diInstance.registerLazySingleton<BoardingRepository>(
      () => BoardingRepositoryImpl(diInstance()));

  // Data Sources
  diInstance.registerLazySingleton<BoardingDataSource>(
      () => BoardingDataSourceImpl(diInstance()));
}
