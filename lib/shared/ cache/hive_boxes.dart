import 'package:hive/hive.dart';

import '../settings/state/system_settings.dart';
import '../settings/state/user_settings.dart';

class HiveBoxes {
  const HiveBoxes._();
  static Box<SystemSettings> get systemSettingsBox => _systemSettingsBox;
  static Box<UserSettings>? get userSettingsBox => _userSettingsBox;
  static Box<Object> get svgCacheBox => _svgCacheBox;

  static late Box<SystemSettings> _systemSettingsBox;
  static late Box<UserSettings>? _userSettingsBox;
  static late Box<Object> _svgCacheBox;

  static void install({
    Box<SystemSettings>? systemSettingsBox,
    Box<Object>? svgCacheBox,
    required Box<UserSettings>? userSettingsBox,
  }) {
    _systemSettingsBox = systemSettingsBox ?? _systemSettingsBox;
    _svgCacheBox = svgCacheBox ?? _svgCacheBox;
    _userSettingsBox = userSettingsBox;
  }
}
