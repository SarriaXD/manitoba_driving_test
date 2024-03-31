import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:manitoba_driving_test/shared/initializer/hive_initializer.dart';

import '../../firebase_options.dart';

class InitService {
  InitService._();

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    await HiveInitializer.init();
  }
}
