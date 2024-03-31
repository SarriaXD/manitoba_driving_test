import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/settings/settings_screen.dart';
import '../quizzes_history/screens/quizzes_history_screen.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  final _pageController = PageController();
  final _historyScrollController = ScrollController();
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          QuizzesHistoryScreen(scrollController: _historyScrollController),
          const SettingsScreen(),
        ],
        onPageChanged: (index) {},
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (value) {
          setState(() {
            _selectedIndex = value;
            _pageController.jumpToPage(value);
          });
        },
        destinations: [
          _buildHistoryNavigationDestination(),
          const NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryNavigationDestination() {
    if (_selectedIndex == 0) {
      return GestureDetector(
        onDoubleTap: () {
          if (_selectedIndex == 0) {
            _historyScrollController.animateTo(
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
