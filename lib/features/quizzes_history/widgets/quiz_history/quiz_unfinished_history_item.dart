import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:manitoba_driving_test/features/quiz/events/quiz_pop_event.dart';
import 'package:manitoba_driving_test/shared/utils/time_formatter.dart';

import '../../../quiz/screens/quiz_host_screen.dart';
import '../../model/quiz_history.dart';

class QuizUnfinishedHistoryItem extends StatelessWidget {
  const QuizUnfinishedHistoryItem({
    super.key,
    required this.history,
    required this.onReloadHistories,
  });
  final QuizHistory history;
  final Function onReloadHistories;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * .6,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
          top: 0,
          bottom: 8,
        ),
        child: OpenContainer<QuizPopEvent>(
          transitionDuration: Durations.long3,
          closedBuilder: (context, action) {
            return _buildContent(context, history);
          },
          middleColor: Theme.of(context).colorScheme.background,
          openColor: Theme.of(context).colorScheme.background,
          closedColor: Color.lerp(
            Theme.of(context).colorScheme.background,
            Theme.of(context).colorScheme.secondaryContainer,
            .3,
          )!,
          closedElevation: 4,
          closedShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          onClosed: (value) {
            if (value == QuizPopEvent.reloadHistories) {
              onReloadHistories();
            }
          },
          openBuilder: (context, action) {
            return QuizHostScreen(historyId: history.id);
          },
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    QuizHistory history,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                TimeFormatter.formatToTimeOrDaysFromNow(history.updateTime),
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSecondaryContainer
                          .withOpacity(.6),
                    ),
              ),
              Icon(
                Icons.navigate_next,
                color: Theme.of(context)
                    .colorScheme
                    .onSecondaryContainer
                    .withOpacity(.8),
              ),
            ],
          ),
          const SizedBox(height: 4),
          _ProgressRow(
            submittedSize: history.submittedSize,
            totalSize: history.totalSize,
          ),
          const SizedBox(height: 4),
          _InfoRows(
            info: {
              'Remain': '${history.totalSize - history.submittedSize}',
              'Spent': TimeFormatter.formatTimeWithWords(history.spentTime),
              'Accuracy':
                  '${history.submittedSize == 0 ? 0 : (history.correctSize / history.submittedSize * 100).toInt()}%',
            },
          ),
        ],
      ),
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
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSecondaryContainer
                          .withOpacity(.8),
                      fontWeight: FontWeight.w800,
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
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
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
    required this.submittedSize,
    required this.totalSize,
  });
  final int submittedSize;
  final int totalSize;

  @override
  Widget build(BuildContext context) {
    final progress = submittedSize / totalSize;
    return Row(
      children: [
        Expanded(
          child: LinearProgressIndicator(
            value: progress,
            color: Theme.of(context).colorScheme.primary.withOpacity(.6),
            backgroundColor: Theme.of(context)
                .colorScheme
                .onSecondaryContainer
                .withOpacity(.2),
            minHeight: 12,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(width: 12),
        Text.rich(
          TextSpan(
            text: '$submittedSize',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  letterSpacing: 2,
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w900,
                ),
            children: [
              TextSpan(
                text: '/$totalSize',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      letterSpacing: 2,
                      color: Theme.of(context)
                          .colorScheme
                          .onSecondaryContainer
                          .withOpacity(.6),
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
