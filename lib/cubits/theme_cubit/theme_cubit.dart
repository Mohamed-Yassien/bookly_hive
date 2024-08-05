import 'package:bookly_hive/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../utils/app_theme.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system) {
    getCurrentAppTheme();
  }

  static ThemeCubit get(context) => BlocProvider.of(context);

  getCurrentAppTheme() {
    if (state == ThemeMode.system) {
      final Brightness currentBrightness = AppTheme.currentSystemBrightness;
      currentBrightness == Brightness.light
          ? setTheme(ThemeMode.light)
          : setTheme(ThemeMode.dark);
    }
  }

  void setTheme(ThemeMode? themeMode) {
    if (themeMode == null) return;
    AppTheme.setStatusBarAndNavigationBarColors(themeMode);
    emit(themeMode);
  }

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    String? value = json[appThemeKey];
    if (value == null) {
      return ThemeMode.system;
    } else if (value == ThemeMode.dark.name) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    return {appThemeKey: state.name};
  }
}
