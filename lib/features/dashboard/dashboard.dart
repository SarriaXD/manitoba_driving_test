import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/settings/settings_screen.dart';
import '../quizzes_history/screens/quizzes_history_screen.dart';

class DashboardScreen extends HookConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState(0);
    final pageController = usePageController(initialPage: 0);
    final historyScrollController = useScrollController();
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          QuizzesHistoryScreen(scrollController: historyScrollController),
          const SettingsScreen(),
        ],
        onPageChanged: (index) {},
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex.value,
        onDestinationSelected: (value) {
          selectedIndex.value = value;
          pageController.jumpToPage(value);
        },
        destinations: [
          _buildHistoryNavigationDestination(
              selectedIndex.value, historyScrollController),
          const NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryNavigationDestination(
      int selectedIndex, ScrollController historyScrollController) {
    if (selectedIndex == 0) {
      return GestureDetector(
        onDoubleTap: () {
          if (selectedIndex == 0) {
            historyScrollController.animateTo(
              0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          }
        },
        child: const NavigationDestination(
          icon: Icon(Icons.home_filled),
          label: 'History',
        ),
      );
    } else {
      return const NavigationDestination(
        icon: Icon(Icons.home_filled),
        label: 'History',
      );
    }
  }
}
