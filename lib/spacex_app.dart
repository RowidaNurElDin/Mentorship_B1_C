import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentoship_rockets_discovries_project/features/onboard/presentation/cubit/onboard_cubit.dart';

import 'config/locale/app_localizations_setup.dart';
import 'config/routes/routes.dart';
import 'config/routes/routes_manager.dart';
import 'config/theme/themes_manager.dart';
import 'core/helpers/colors_manager.dart';
import 'core/helpers/strings_manager.dart';
import 'core/themes/presentation/cubit/theme_cubit.dart';
import 'injection_container.dart';

class SpacexApp extends StatelessWidget {
  const SpacexApp({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => diInstance<ThemeCubit>()..getSavedTheme(),
        ),
        BlocProvider<OnboardCubit>(
          create: (context) => diInstance<OnboardCubit>()..getBoarding(),
        ),
        // BlocProvider<SetupProfileCubit>(
        //   create: (context) => SetupProfileCubit(
        //     diInstance(),
        //     diInstance(),
        //     diInstance(),
        //     diInstance(),
        //     diInstance(),
        //     diInstance(),
        //     diInstance(),
        //     diInstance(),
        //     diInstance(),
        //     diInstance(),
        //     diInstance(),
        //   ),
        // ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        splitScreenMode: true,
        builder: (context, child) => child!,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Builder(
            builder: (context) {
              final themeState = context.watch<ThemeCubit>().state;

              final SystemUiOverlayStyle overlayStyle =
                  themeState == ThemeMode.dark
                      ? const SystemUiOverlayStyle(
                          statusBarBrightness: Brightness.dark,
                          statusBarColor: ColorsManager.darkBackgroundColor)
                      : const SystemUiOverlayStyle(
                          statusBarBrightness: Brightness.light,
                          statusBarColor: ColorsManager.backgroundColor);

              return AnnotatedRegion<SystemUiOverlayStyle>(
                value: overlayStyle,
                child: MaterialApp(
                  // darkTheme:
                  //     Themes.getDarkTheme(language: localeState.languageCode),
                  // theme:
                  //     Themes.getLightTheme(language: localeState.languageCode),
                  themeMode: themeState,
                  debugShowCheckedModeBanner: false,
                  title: StringsManager.appName,
                  navigatorKey: navigatorKey,
                  initialRoute: Routes.splashScreen,
                  onGenerateRoute: RoutesManager.generateRoute,
                  localizationsDelegates:
                      AppLocalizationsSetup.localizationsDelegates,
                  supportedLocales: AppLocalizationsSetup.supportedLocales,
                  localeResolutionCallback:
                      AppLocalizationsSetup.localeResolutionCallback,
                  // locale: localeState,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
