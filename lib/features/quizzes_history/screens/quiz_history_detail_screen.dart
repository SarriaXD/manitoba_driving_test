import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manitoba_driving_test/features/quiz/events/quiz_pop_event.dart';
import 'package:manitoba_driving_test/features/quiz/viewmodel/quiz_viewmodel.dart';
import 'package:manitoba_driving_test/features/quizzes_history/widgets/quiz_history_detail/quiz_history_detail_list.dart';

import '../../../shared/widgets/dark_mode_switch_button.dart';
import '../../quiz/models/question.dart';

class QuizHistoryDetailScreen extends ConsumerStatefulWidget {
  const QuizHistoryDetailScreen({
    super.key,
    required this.historyId,
    this.needReloadHistories = false,
  });
  final int historyId;
  final bool needReloadHistories;
  @override
  ConsumerState<QuizHistoryDetailScreen> createState() =>
      _QuizHistoryDetailScreenState();
}

class _QuizHistoryDetailScreenState
    extends ConsumerState<QuizHistoryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(quizViewModelProvider(widget.historyId));
    final questions = state.questions;
    return PopScope(
      canPop: false,
      onPopInvoked: (canPop) {
        if (!canPop) {
          if (widget.needReloadHistories) {
            Navigator.of(context).pop(QuizPopEvent.reloadHistories);
          } else {
            Navigator.of(context).pop();
          }
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: CloseButton(
                  onPressed: () {
                    if (widget.needReloadHistories) {
                      Navigator.of(context).pop(QuizPopEvent.reloadHistories);
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                ),
                actions: const [
                  DarkModeSwitchButton(),
                ],
              ),
              QuizHistoryDetailSliverList(
                  questions: reorderQuestions(questions)),
            ],
          ),
        ),
      ),
    );
  }

  List<Question> reorderQuestions(List<Question> questions) {
    return questions.sortedByCompare(
      (element) => element.selectedAnswerId == element.correctAnswerId,
      (a, b) => a ? 1 : -1,
    );
  }
}
