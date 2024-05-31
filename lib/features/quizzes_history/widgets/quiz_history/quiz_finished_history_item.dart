import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:manitoba_driving_test/features/quizzes_history/model/quiz_history.dart';
import 'package:manitoba_driving_test/features/quizzes_history/screens/quiz_history_detail_screen.dart';
import 'package:manitoba_driving_test/shared/theme/colors.dart';

import '../../../../shared/utils/time_formatter.dart';

class QuizFinishedHistoryItem extends HookWidget {
  const QuizFinishedHistoryItem({
    super.key,
    required this.history,
    required this.onRemove,
  });

  final QuizHistory history;
  final void Function(int) onRemove;

  @override
  Widget build(BuildContext context) {
    final singleTickerProvider = useSingleTickerProvider();
    final controller = useMemoized(() => SlidableController(
          singleTickerProvider,
        ));
    return Slidable(
      controller: controller,
      key: ValueKey(history.id),
      endActionPane: _buildSlidableActionPane(context, controller),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: OpenContainer(
          transitionDuration: Durations.long3,
          closedBuilder: (context, action) {
            return _buildContent(context);
          },
          middleColor: Theme.of(context).colorScheme.background,
          openColor: Theme.of(context).colorScheme.background,
          closedColor: Theme.of(context).colorScheme.background,
          closedElevation: 0,
          closedShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          openBuilder: (context, action) {
            return QuizHistoryDetailScreen(historyId: history.id);
          },
        ),
      ),
    );
  }

  ActionPane _buildSlidableActionPane(
      BuildContext context, SlidableController controller) {
    return ActionPane(
      motion: const ScrollMotion(),
      extentRatio: 0.4,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => controller.dismiss(
              ResizeRequest(
                Durations.medium2,
                () {
                  onRemove(history.id);
                },
              ),
            ),
            child: Card(
              color:
                  Theme.of(context).colorScheme.errorContainer.withOpacity(.8),
              margin: const EdgeInsets.only(
                top: 8,
                bottom: 8,
                right: 8,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.delete,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Remove',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.error,
                        ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.onBackground.withOpacity(.2),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            _getIcon(history.correctSize, history.totalSize),
            color: Theme.of(context)
                .colorScheme
                .onSecondaryContainer
                .withOpacity(.8),
            size: 36,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _InfoRows(
                  info: {
                    'Spent':
                        TimeFormatter.formatTimeWithWords(history.spentTime),
                    'Accuracy':
                        '${history.submittedSize == 0 ? 0 : (history.correctSize / history.submittedSize * 100).toInt()}%',
                  },
                ),
                const SizedBox(height: 8),
                _CorrectSizeRow(
                  correctSize: history.correctSize,
                  totalSize: history.totalSize,
                ),
                const SizedBox(height: 8),
                _ProgressRow(
                  correctSize: history.correctSize,
                  totalSize: history.totalSize,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Icon(
            Icons.navigate_next,
            color: Theme.of(context)
                .colorScheme
                .onSecondaryContainer
                .withOpacity(.8),
            size: 32,
          ),
        ],
      ),
    );
  }

  IconData _getIcon(int correctSize, int totalSize) {
    final accuracy = correctSize / totalSize;
    if (accuracy >= 0.9) {
      return Icons.verified_outlined;
    } else if (accuracy >= 0.8) {
      return Icons.hotel_class_outlined;
    } else if (accuracy >= 0.7) {
      return Icons.star;
    } else if (accuracy >= 0.6) {
      return Icons.star_half_outlined;
    } else if (accuracy >= 0.5) {
      return Icons.mood_outlined;
    } else {
      return Icons.mood_bad_outlined;
    }
  }
}

class _CorrectSizeRow extends StatelessWidget {
  const _CorrectSizeRow({
    required this.correctSize,
    required this.totalSize,
  });
  final int correctSize;
  final int totalSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Icon(
              Icons.thumb_up,
              color: Theme.of(context).colorScheme.customGreenColor,
            ),
            const SizedBox(width: 4),
            Text(
              '$correctSize',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.customGreenColor,
                    fontWeight: FontWeight.w900,
                  ),
            ),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            Text(
              '${totalSize - correctSize}',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.error.withOpacity(.8),
                    fontWeight: FontWeight.w900,
                  ),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.thumb_down,
              color: Theme.of(context).colorScheme.error.withOpacity(.8),
            ),
          ],
        ),
      ],
    );
  }
}

class _InfoRows extends StatelessWidget {
  const _InfoRows({
    required this.info,
  });
  final Map<String, String> info;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final entry in info.entries)
              Text(
                "${entry.key}: ",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSecondaryContainer
                          .withOpacity(.8),
                      fontWeight: FontWeight.w700,
                    ),
              ),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            for (final entry in info.entries)
              Text(
                entry.value,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                      fontWeight: FontWeight.w900,
                    ),
              )
          ],
        )
      ],
    );
  }
}

class _ProgressRow extends StatelessWidget {
  const _ProgressRow({
    required this.correctSize,
    required this.totalSize,
  });
  final int correctSize;
  final int totalSize;

  @override
  Widget build(BuildContext context) {
    final progress = correctSize / totalSize;
    return LinearProgressIndicator(
      value: progress,
      color: Theme.of(context).colorScheme.customGreenColor,
      backgroundColor: Theme.of(context).colorScheme.error.withOpacity(.8),
      minHeight: 14,
      borderRadius: BorderRadius.circular(16),
    );
  }
}
