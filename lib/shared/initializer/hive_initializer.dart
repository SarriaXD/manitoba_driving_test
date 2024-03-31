import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:manitoba_driving_test/shared/settings/state/system_settings.dart';
import 'package:manitoba_driving_test/shared/settings/state/user_settings.dart';

import '../ cache/hive_boxes.dart';
import '../const/settings_const.dart';

class HiveInitializer {
  HiveInitializer._();

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(SystemSettingsAdapter());
    Hive.registerAdapter(UserSettingsAdapter());
    final systemSettingsBox =
        await Hive.openBox<SystemSettings>(SettingsConst.systemSettingsBox);
    final svgCacheBox = await Hive.openBox<Object>(SettingsConst.svgCacheBox);
    final user = FirebaseAuth.instance.currentUser;
    Box<UserSettings>? userSettingsBox;
    if (user != null) {
      userSettingsBox = await Hive.openBox<UserSettings>(user.uid);
    } else {
      userSettingsBox = null;
    }
    HiveBoxes.install(
      systemSettingsBox: systemSettingsBox,
      svgCacheBox: svgCacheBox,
      userSettingsBox: userSettingsBox,
    );
    FirebaseAuth.instance.userChanges().listen((user) async {
      HiveBoxes.install(userSettingsBox: userSettingsBox);
    });
  }
}
