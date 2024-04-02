import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manitoba_driving_test/shared/%20cache/hive_boxes.dart';
import 'package:manitoba_driving_test/shared/settings/state/system_settings.dart';
import 'package:manitoba_driving_test/shared/settings/state/user_settings.dart';

import '../../const/settings_const.dart';
import '../state/settings.dart';

class UserSettingsNotifier extends StateNotifier<Settings> {
  UserSettingsNotifier()
      : super(
          Settings(
              systemSettings: SystemSettings(
                isDarkMode: true,
                followSystem: true,
                themeColor: const Color.fromARGB(255, 154, 67, 0).value,
                isThemeColorFromWallpaper: false,
                language: 'en',
              ),
              userSettings: UserSettings(
                preferredQuestionQty: 10,
              )),
        ) {
    _init();
  }

  _init() async {
    var systemSettings =
        HiveBoxes.systemSettingsBox.get(SettingsConst.systemSettingsKey);
    var userSettings =
        HiveBoxes.userSettingsBox?.get(SettingsConst.userSettingsKey);
    systemSettings = systemSettings ?? state.systemSettings;
    userSettings = userSettings ?? state.userSettings;
    state = Settings(
      systemSettings: systemSettings,
      userSettings: userSettings,
    );
    updateSystemDarkness();
  }

  void updateSettings({
    bool? isDarkMode,
    bool? followSystem,
    String? language,
    int? themeColor,
    bool? isThemeColorFromWallpaper,
    int? preferredQuestionNumber,
  }) {
    final systemSettings = state.systemSettings;
    final userSettings = state.userSettings;
    final updatedSystemSettings = SystemSettings(
      isDarkMode: isDarkMode ?? systemSettings.isDarkMode,
      followSystem: followSystem ?? systemSettings.followSystem,
      themeColor: themeColor ?? systemSettings.themeColor,
      isThemeColorFromWallpaper:
          isThemeColorFromWallpaper ?? systemSettings.isThemeColorFromWallpaper,
      language: language ?? systemSettings.language,
    );
    final updatedUserSettings = UserSettings(
      preferredQuestionQty:
          preferredQuestionNumber ?? userSettings.preferredQuestionQty,
    );
    state = Settings(
      systemSettings: updatedSystemSettings,
      userSettings: updatedUserSettings,
    );
    HiveBoxes.systemSettingsBox
        .put(SettingsConst.systemSettingsKey, updatedSystemSettings);
    HiveBoxes.userSettingsBox
        ?.put(SettingsConst.userSettingsKey, updatedUserSettings);
  }

  void updateSystemDarkness() {
    if (state.systemSettings.followSystem) {
      final systemBrightness =
          WidgetsBinding.instance.platformDispatcher.platformBrightness;
      updateSettings(isDarkMode: systemBrightness == Brightness.dark);
    }
  }
}

final userSettingsProvider =
    StateNotifierProvider<UserSettingsNotifier, Settings>((ref) {
  return UserSettingsNotifier();
});
