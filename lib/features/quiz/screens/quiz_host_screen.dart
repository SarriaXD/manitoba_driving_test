import 'package:flutter/material.dart';
import 'package:manitoba_driving_test/features/quiz/screens/quiz_question_screen.dart';
import 'package:manitoba_driving_test/features/quiz/screens/quiz_result_screen.dart';
import 'package:manitoba_driving_test/features/quizzes_history/screens/quiz_history_detail_screen.dart';

import 'quiz_question_quantity_screen.dart';

class QuizHostScreen extends StatefulWidget {
  const QuizHostScreen({super.key, this.historyId});
  final int? historyId;

  @override
  State<QuizHostScreen> createState() => _QuizHostScreenState();
}

class _QuizHostScreenState extends State<QuizHostScreen> {
  late Widget currentScreen;
  @override
  void initState() {
    if (widget.historyId == null) {
      currentScreen = generateQuizQuestionQuantityScreen();
    } else {
      currentScreen = generateQuizQuestionScreen(historyId: widget.historyId!);
    }
    super.initState();
  }

  Widget generateQuizQuestionQuantityScreen() {
    return QuizQuestionQuantityScreen(
      onNext: () {
        setState(() {
          currentScreen = generateQuizQuestionScreen(historyId: null);
        });
      },
    );
  }

  Widget generateQuizQuestionScreen({required int? historyId}) {
    return QuizQuestionScreen(
      historyId: historyId,
      onNavigateToResultScreen: (newHistoryId) {
        setState(
          () {
            currentScreen = generateQuizResultScreen(newHistoryId);
          },
        );
      },
    );
  }

  Widget generateQuizResultScreen(int historyId) {
    return QuizResultScreen(
      historyId: historyId,
      onReviewQuiz: () {
        setState(
          () {
            currentScreen = generateQuizHistoryDetailScreen(
              historyId: historyId,
              needReloadHistories: true,
            );
          },
        );
      },
      onRetryQuiz: () {
        setState(
          () {
            currentScreen = generateQuizQuestionScreen(historyId: null);
          },
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
    return Scaffold(
      body: AnimatedSwitcher(
        key: ValueKey(widget.historyId),
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
        child: currentScreen,
      ),
    );
  }
}
