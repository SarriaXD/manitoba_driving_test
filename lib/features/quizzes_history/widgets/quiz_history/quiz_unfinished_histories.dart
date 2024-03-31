import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:manitoba_driving_test/features/quiz/events/quiz_pop_event.dart';
import 'package:manitoba_driving_test/shared/widgets/diff_util_list.dart';

import '../../../../shared/animation/curve.dart';
import '../../../../shared/animation/list_item_transition.dart';
import '../../../quiz/screens/quiz_host_screen.dart';
import '../../model/quiz_history.dart';
import 'quiz_unfinished_history_item.dart';

class QuizUnfinishedHistories extends StatelessWidget {
  const QuizUnfinishedHistories(
      {super.key, required this.histories, required this.onReloadHistories});
  final List<QuizHistory> histories;
  final Function onReloadHistories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: _PrototypeHeight(
        listView: DiffUtilList.fromKeyedWidgetList(
          key: const ValueKey('unfinished_histories'),
          scrollDirection: Axis.horizontal,
          children: [
            _StartQuiz(
              key: const ValueKey('start_quiz'),
              onReloadHistories: onReloadHistories,
            ),
            for (final history in histories)
              QuizUnfinishedHistoryItem(
                key: ValueKey(history.id),
                history: history,
                onReloadHistories: onReloadHistories,
              ),
          ],
          insertAnimationBuilder: (context, animation, child) {
            return ListItemTransition(
              curve: CustomAddCurve(
                heroDuration: Durations.long3.inMilliseconds,
                addDuration: _animationDuration.inMilliseconds,
                expectedCurve: Curves.easeOutCubic,
              ),
              animation: animation,
              axis: Axis.horizontal,
              child: child,
            );
          },
          removeAnimationBuilder: (context, animation, child) {
            return ListItemTransition(
              curve: CustomRemoveCurve(
                heroDuration: Durations.long3.inMilliseconds,
                removeDuration: _animationDuration.inMilliseconds,
                expectedCurve: Curves.easeInCubic,
              ),
              animation: animation,
              axis: Axis.horizontal,
              child: child,
            );
          },
          insertAnimationDuration: _animationDuration,
          removeAnimationDuration: _animationDuration,
        ),
      ),
    );
  }

  Duration get _animationDuration => Durations.long3 + Durations.extralong1;
}

class _StartQuiz extends StatelessWidget {
  const _StartQuiz({super.key, required this.onReloadHistories});
  final Function onReloadHistories;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: 96,
        height: 96,
        child: OpenContainer<QuizPopEvent>(
          transitionDuration: Durations.long3,
          closedBuilder: (context, action) {
            return Icon(
              size: 56,
              Icons.add,
              color: Theme.of(context).colorScheme.onPrimary.withOpacity(.8),
            );
          },
          middleColor: Theme.of(context).colorScheme.background,
          openColor: Theme.of(context).colorScheme.background,
          closedColor: Theme.of(context).colorScheme.primary.withOpacity(.8),
          closedElevation: 6,
          closedShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          openBuilder: (context, closeContainer) {
            return const QuizHostScreen();
          },
          onClosed: (value) {
            if (value == QuizPopEvent.reloadHistories) {
              onReloadHistories();
            }
          },
        ),
      ),
    );
  }
}

class _PrototypeHeight extends StatelessWidget {
  final DiffUtilList listView;

  const _PrototypeHeight({
    required this.listView,
  });

  // this just a workaround to calculate the height of the list item
  // cause horizontal list view need to specify the height
  // but i need the height to be dynamic, as small as possible
  Widget get prototype => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: QuizUnfinishedHistoryItem(
          history: QuizHistory(
            id: 0,
            createTime: DateTime.now(),
            updateTime: DateTime.now(),
            language: 'English',
            correctSize: 0,
            totalSize: 1,
            submittedSize: 0,
            isFinished: false,
            spentTime: 0,
          ),
          onReloadHistories: () {},
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IgnorePointer(
          child: Opacity(
            opacity: 0.0,
            child: prototype,
          ),
        ),
        const SizedBox(width: double.infinity),
        Positioned.fill(child: listView),
      ],
    );
  }
}
