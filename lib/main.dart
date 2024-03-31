import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manitoba_driving_test/shared/initializer/init_service.dart';

import 'app.dart';

void main() async {
  await InitService.init();
  runApp(
    const ProviderScope(
      child: ManitobaDrivingTestApp(),
    ),
  );
}
