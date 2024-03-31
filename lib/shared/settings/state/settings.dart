import 'package:manitoba_driving_test/shared/settings/state/system_settings.dart';
import 'package:manitoba_driving_test/shared/settings/state/user_settings.dart';

class Settings {
  Settings({
    required this.systemSettings,
    required this.userSettings,
  });
  final SystemSettings systemSettings;
  final UserSettings userSettings;
}
