import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'shared/routers/routers.dart';
import 'shared/settings/provider/user_settings_provider.dart';
import 'shared/theme/theme_provider.dart';
import 'shared/utils/edge_to_edge.dart';

class ManitobaDrivingTestApp extends HookConsumerWidget {
  const ManitobaDrivingTestApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    context.enableEdgetToEdget();
    useOnPlatformBrightnessChange((previous, current) =>
        ref.read(userSettingsProvider.notifier).updateSystemDarkness());
    return MaterialApp.router(
      routerConfig: routers,
      theme: ref.watch(themeProvider),
      scrollBehavior: const ScrollBehavior().copyWith(
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
