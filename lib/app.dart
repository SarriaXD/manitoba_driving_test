import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'shared/routers/routers.dart';
import 'shared/settings/provider/user_settings_provider.dart';
import 'shared/theme/theme_provider.dart';
import 'shared/utils/edge_to_edge.dart';

class ManitobaDrivingTestApp extends ConsumerStatefulWidget {
  const ManitobaDrivingTestApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ManitobaDrivingTestAppState();
  }
}

class _ManitobaDrivingTestAppState extends ConsumerState<ManitobaDrivingTestApp>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _updateThemeDarkness();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.enableEdgetToEdget();
    return MaterialApp.router(
      routerConfig: routers,
      theme: ref.watch(themeProvider),
      scrollBehavior: const ScrollBehavior().copyWith(
        physics: const BouncingScrollPhysics(),
      ),
    );
  }

  @override
  void didChangePlatformBrightness() {
    _updateThemeDarkness();
    super.didChangePlatformBrightness();
  }

  void _updateThemeDarkness() {
    final userSettings = ref.read(userSettingsProvider);
    if (userSettings.systemSettings.followSystem) {
      final systemBrightness =
          WidgetsBinding.instance.platformDispatcher.platformBrightness;
      ref.read(userSettingsProvider.notifier).updateSettings(
            isDarkMode: systemBrightness == Brightness.dark,
          );
    }
  }
}
