import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../constants/themes.dart';
import '../constants/settings_keys.dart' as keys_constants;

import 'settings_service.dart';

class ThemeService extends GetxService {
  ThemeData _currentThemeData = ThemeData();

  ThemeData? get currentTheme => _currentThemeData;

  Future<ThemeService> init() async {
    _currentThemeData = setTheme();
    return this;
  }

  enableDarkMode() {
    SettingsService().putString(keys_constants.themeKey, 'dark');
    Get.changeTheme(setTheme());
  }

  disableDarkMode() {
    SettingsService().putString(keys_constants.themeKey, 'light');
    Get.changeTheme(setTheme());
  }

  ThemeData setTheme() {
    switch (SettingsService().getString(keys_constants.themeKey)) {
      case 'dark':
        _currentThemeData = darkRedTheme;
        return darkRedTheme;
      case 'light':
        _currentThemeData = lightRedTheme;
        return lightRedTheme;
      default:
        _currentThemeData = lightRedTheme;
        return lightRedTheme;
    }
  }
}
