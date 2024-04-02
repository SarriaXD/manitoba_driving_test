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
    _updateSystemDarkness();
    super.didChangePlatformBrightness();
  }

  void _updateSystemDarkness() {
    ref.read(userSettingsProvider.notifier).updateSystemDarkness();
  }
}
