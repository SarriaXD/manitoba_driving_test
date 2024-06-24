import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:manitoba_driving_test/features/quiz/events/quiz_pop_event.dart';
import 'package:manitoba_driving_test/features/quiz/widgets/quiz_result/quiz_result_information.dart';
import 'package:manitoba_driving_test/features/quizzes_history/model/quiz_history.dart';
import 'package:manitoba_driving_test/features/quizzes_history/repository/quizzes_history_repository.dart';
import 'package:manitoba_driving_test/shared/widgets/dark_mode_switch_button.dart';

import '../widgets/quiz_result/quiz_result_circle_progress.dart';
import '../widgets/quiz_result/quiz_result_lottie_animation.dart';

enum _ResultQuality {
  perfect,
  great,
  good,
  niceTry,
}

class QuizResultScreen extends HookConsumerWidget {
  const QuizResultScreen({
    super.key,
    required this.historyId,
    required this.onReviewQuiz,
    required this.onRetryQuiz,
  });

  final int historyId;
  final Function() onReviewQuiz;
  final Function() onRetryQuiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyRepository = ref.watch(quizzesHistoryRepositoryProvider(
        FirebaseAuth.instance.currentUser?.uid));
    return PopScope(
      canPop: false,
      onPopInvoked: (canPop) {
        if (!canPop) {
          Navigator.of(context).pop(QuizPopEvent.reloadHistories);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: const CloseButton(),
          actions: const [DarkModeSwitchButton()],
        ),
        body: FutureBuilder(
          future: historyRepository.getHistory(historyId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            final history = snapshot.data as QuizHistory;
            final resultQuality = _getResultQuality(
              history.correctSize,
              history.totalSize,
            );
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const SizedBox(height: 16),
                          Text(
                            _getResultTitle(resultQuality),
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 32,
                                ),
                          ),
                          const QuizResultLottieAnimation(
                            path:
                                'assets/animations/lottie_quiz_result_congratulation.json',
                          ),
                          QuizResultInformation(history: history),
                          const SizedBox(height: 32),
                          QuizResultCircleProgress(
                            correctSize: history.correctSize,
                            totalSize: history.totalSize,
                          ),
                        ]
                            .animate(interval: Durations.short2)
                            .fadeIn(
                              duration: Durations.long1,
                              curve: Curves.easeOutCubic,
                            )
                            .slideY(
                              begin: 1,
                              duration: Durations.long1,
                              curve: Curves.easeOutCubic,
                            )
                            .scaleXY(
                              begin: 0.5,
                              duration: Durations.long1,
                              curve: Curves.easeOutCubic,
                            ),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            onPressed: onReviewQuiz,
                            child: const Text('Review Quiz'),
                          ),
                        ),
                        const SizedBox(height: 8),
                        _DelayedEnableTextButton(
                          onRetryQuiz: onRetryQuiz,
                        ),
                      ]
                          .animate(
                            interval: Durations.short2,
                          )
                          .fadeIn(
                            duration: Durations.long1,
                            curve: Curves.easeOutCubic,
                          )
                          .slideY(
                            begin: 1,
                            duration: Durations.long1,
                            curve: Curves.easeOutCubic,
                          )
                          .scaleXY(
                            begin: 0.5,
                            duration: Durations.long1,
                            curve: Curves.easeOutCubic,
                          ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  String _getResultTitle(_ResultQuality resultQuality) {
    switch (resultQuality) {
      case _ResultQuality.perfect:
        return 'Perfect!';
      case _ResultQuality.great:
        return 'Great!';
      case _ResultQuality.good:
        return 'Good!';
      case _ResultQuality.niceTry:
        return 'Nice Try!';
    }
  }

  _ResultQuality _getResultQuality(int correctSize, int totalSize) {
    final result = correctSize / totalSize;
    if (result >= 0.9) {
      return _ResultQuality.perfect;
    } else if (result >= 0.8) {
      return _ResultQuality.great;
    } else if (result >= 0.6) {
      return _ResultQuality.good;
    } else {
      return _ResultQuality.niceTry;
    }
  }
}

class _DelayedEnableTextButton extends HookWidget {
  const _DelayedEnableTextButton({required this.onRetryQuiz});

  final Function() onRetryQuiz;

  @override
  Widget build(BuildContext context) {
    final canPress = useState(false);
    useEffect(() {
      Future.delayed(1.seconds, () {
        canPress.value = true;
      });
      return null;
    }, []);
    return TextButton.icon(
      onPressed: canPress.value ? onRetryQuiz : null,
      icon: const Icon(Icons.replay),
      label: const Text('Retry'),
    );
  }
}
