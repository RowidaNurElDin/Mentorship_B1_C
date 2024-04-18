import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/usecases/no_param.dart';
import '../../domain/usecases/change_theme.dart';
import '../../domain/usecases/get_saved_theme.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit({
    required this.getSavedThemeUseCase,
    required this.changeThemeUseCase,
  }) : super(ThemeMode.light);

  final GetSavedThemeUseCase getSavedThemeUseCase;
  final ChangeThemeUseCase changeThemeUseCase;
  static ThemeCubit get(context) => BlocProvider.of<ThemeCubit>(context);

  ThemeMode _currentThemeMode = ThemeMode.light;

  //get saved theme
  Future<void> getSavedTheme() async {
    final response = await getSavedThemeUseCase.call(NoParams());
    response.fold((failure) => null, (value) {
      _currentThemeMode = value == 'light' ? ThemeMode.light : ThemeMode.dark;
      emit(_currentThemeMode);
    });
  }

  //change theme
  Future<void> _changeTheme(String themeMode) async {
    final Brightness platformBrightness = WidgetsBinding.instance.window.platformBrightness;

    final response = await changeThemeUseCase.call(themeMode);
    response.fold((failure) => null, (value) {
      if (value) {
        _currentThemeMode =
            themeMode == ThemeMode.light.name ? ThemeMode.light : ThemeMode.dark;
        emit(_currentThemeMode);
      }
    });
  }

  void changeCurrentThemeMode(String themeMode) {

    if(themeMode==ThemeMode.system.name){
      final Brightness platformBrightness =
          WidgetsBinding.instance.window.platformBrightness;
      themeMode= platformBrightness == Brightness.light
          ? ThemeMode.light.name
          : ThemeMode.dark.name;
    }
    _changeTheme(themeMode);
  }
}
