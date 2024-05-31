import 'package:firebase_auth/firebase_auth.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:manitoba_driving_test/shared/%20cache/hive_boxes.dart';
import 'package:manitoba_driving_test/shared/evn/env_screen.dart';

import '../widgets/dark_mode_switch_button.dart';
import '../widgets/filled_bottom_button.dart';
import 'provider/user_settings_provider.dart';
import 'widgets/settings_color_picker.dart';

class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useAutomaticKeepAlive(wantKeepAlive: true);
    final state = ref.watch(userSettingsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings', textScaler: TextScaler.linear(1.2)),
        centerTitle: false,
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w900,
              color: Theme.of(context).colorScheme.onBackground.withOpacity(.8),
            ),
        actions: const [
          DarkModeSwitchButton(),
        ],
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Following System'),
            value: state.systemSettings.followSystem,
            onChanged: (value) {
              final settingsNotifier = ref.read(userSettingsProvider.notifier);
              if (value) {
                settingsNotifier.updateSettings(
                  isDarkMode: MediaQuery.platformBrightnessOf(context) ==
                      Brightness.dark,
                  followSystem: value,
                );
              } else {
                settingsNotifier.updateSettings(followSystem: value);
              }
            },
          ),
          ListTile(
            title: const Text('Color'),
            trailing: ColorIndicator(
              width: 44,
              height: 44,
              borderRadius: 4,
              color: Color(state.systemSettings.themeColor),
            ),
            onTap: () async {
              final color = await showAdaptiveColorPicker(
                context: context,
                initialColor: Color(state.systemSettings.themeColor),
              );
              if (color != null) {
                ref
                    .read(userSettingsProvider.notifier)
                    .updateSettings(themeColor: color.value);
              }
            },
          ),
          ListTile(
            title: const Text('Language (en/fr)'),
            onTap: () {
              if (state.systemSettings.language == 'en') {
                ref
                    .read(userSettingsProvider.notifier)
                    .updateSettings(language: 'fr');
              } else {
                ref
                    .read(userSettingsProvider.notifier)
                    .updateSettings(language: 'en');
              }
            },
            subtitle: Text(
                state.systemSettings.language == 'en' ? 'English' : 'French'),
            trailing: const Icon(Icons.language),
          ),
          ListTile(
            title: const Text('environment'),
            onTap: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => const EnvScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Clear Cache'),
            onTap: () {
              HiveBoxes.svgCacheBox.clear();
            },
          ),
          Padding(
            padding: const EdgeInsets.all(32),
            child: FilledBottomButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  context.go('/auth');
                },
                child: const Text('Log Out')),
          )
        ],
      ),
    );
  }
}
