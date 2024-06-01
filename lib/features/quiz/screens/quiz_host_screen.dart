import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:manitoba_driving_test/features/quiz/screens/quiz_question_screen.dart';
import 'package:manitoba_driving_test/features/quiz/screens/quiz_result_screen.dart';
import 'package:manitoba_driving_test/features/quizzes_history/screens/quiz_history_detail_screen.dart';

import 'quiz_question_quantity_screen.dart';

class QuizHostScreen extends HookWidget {
  const QuizHostScreen({super.key, this.historyId});
  final int? historyId;

  Widget generateQuizQuestionQuantityScreen(
      ValueNotifier<Widget> currentScreen) {
    return QuizQuestionQuantityScreen(
      onNext: () {
        currentScreen.value = generateQuizQuestionScreen(
          historyId: null,
          currentScreen: currentScreen,
        );
      },
    );
  }

  Widget generateQuizQuestionScreen(
      {required int? historyId, required ValueNotifier<Widget> currentScreen}) {
    return QuizQuestionScreen(
      historyId: historyId,
      onNavigateToResultScreen: (newHistoryId) {
        currentScreen.value = generateQuizResultScreen(
          historyId: newHistoryId,
          currentScreen: currentScreen,
        );
      },
    );
  }

  Widget generateQuizResultScreen(
      {required int historyId, required ValueNotifier<Widget> currentScreen}) {
    return QuizResultScreen(
      historyId: historyId,
      onReviewQuiz: () {
        currentScreen.value = generateQuizHistoryDetailScreen(
          historyId: historyId,
          needReloadHistories: true,
        );
      },
      onRetryQuiz: () {
        currentScreen.value = generateQuizQuestionScreen(
          historyId: null,
          currentScreen: currentScreen,
        );
      },
    );
  }

  Widget generateQuizHistoryDetailScreen({
    required int historyId,
    bool needReloadHistories = false,
  }) {
    return QuizHistoryDetailScreen(
      historyId: historyId,
      needReloadHistories: needReloadHistories,
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentScreen = useState<Widget>(const SizedBox());
    useEffect(() {
      if (historyId == null) {
        currentScreen.value = generateQuizQuestionQuantityScreen(currentScreen);
      } else {
        currentScreen.value = generateQuizQuestionScreen(
            historyId: historyId, currentScreen: currentScreen);
      }
      return null;
    }, []);
    return Scaffold(
      body: AnimatedSwitcher(
        key: ValueKey(historyId),
        duration: Durations.extralong4,
        switchInCurve: Curves.fastLinearToSlowEaseIn,
        switchOutCurve: Curves.fastOutSlowIn,
        transitionBuilder: (child, animation) {
          final tween = Tween<double>(
            begin: 0.9,
            end: 1.0,
          ).animate(animation);
          return FadeTransition(
            opacity: tween,
            child: ScaleTransition(
              scale: tween,
              child: child,
            ),
          );
        },
        child: currentScreen.value,
      ),
    );
  }
}
