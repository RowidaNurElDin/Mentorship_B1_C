import 'package:flutter/material.dart';

import '../../../cache/cache_keys.dart';
import '/core/cache/cache_consumer.dart';

abstract class ThemeLocalDataSource {
  Future<bool> changeTheme({required String themeMode});

  Future<String> getSavedTheme();
}

class ThemeLocalDataSourceImpl implements ThemeLocalDataSource {
  final CacheConsumer cacheConsumer;

  ThemeLocalDataSourceImpl({
    required this.cacheConsumer,
  });

  @override
  Future<bool> changeTheme({required String themeMode}) async {
    return await cacheConsumer.saveData(key: CacheKeys.theme, value: themeMode);
  }

  @override
  Future<String> getSavedTheme() async {
    final Brightness platformBrightness =
        WidgetsBinding.instance.window.platformBrightness;
    print('ThemeMode.light.name ${platformBrightness}');
    final defaultSystemValue = platformBrightness == Brightness.light
        ? ThemeMode.light.name
        : ThemeMode.dark.name;
    return cacheConsumer.getData<String>(
        key: CacheKeys.theme, defaultValue: 'light');
    //Theme.data.system.lowerCase
  }
}
