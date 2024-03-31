import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../settings/provider/user_settings_provider.dart';

class DarkModeSwitchButton extends ConsumerWidget {
  const DarkModeSwitchButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(userSettingsProvider
        .select((value) => value.systemSettings.isDarkMode));
    final userSettingsNotifier = ref.watch(userSettingsProvider.notifier);
    return IconButton(
      onPressed: () {
        userSettingsNotifier.updateSettings(
          isDarkMode: !isDarkMode,
          followSystem: false,
        );
      },
      icon: AnimatedSwitcher(
        duration: Durations.medium1,
        switchInCurve: Curves.ease,
        switchOutCurve: Curves.ease,
        child: isDarkMode
            ? const Icon(key: ValueKey('dark'), Icons.nightlight_round)
            : const Icon(key: ValueKey('light'), Icons.wb_sunny),
        transitionBuilder: (child, animation) {
          return RotationTransition(
            turns: animation,
            child: ScaleTransition(
              scale: animation,
              child: child,
            ),
          );
        },
      ),
    );
  }
}
