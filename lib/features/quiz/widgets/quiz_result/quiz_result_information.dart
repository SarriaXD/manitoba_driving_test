import 'package:flutter/material.dart';
import 'package:manitoba_driving_test/features/quizzes_history/model/quiz_history.dart';

import '../../../../shared/utils/time_formatter.dart';

class QuizResultInformation extends StatelessWidget {
  const QuizResultInformation({super.key, required this.history});
  final QuizHistory history;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DefaultTextStyle(
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(.65),
                  ) ??
              const TextStyle(),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Points',
              ),
              SizedBox(height: 8),
              Text(
                'Duration',
              ),
            ],
          ),
        ),
        const SizedBox(width: 48),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                text: history.correctSize.toString(),
                children: [
                  TextSpan(
                    text: '/',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(.6),
                          letterSpacing: 8,
                        ),
                  ),
                  TextSpan(
                    text: history.totalSize.toString(),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w900,
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(.8),
                          letterSpacing: 8,
                        ),
                  ),
                ],
              ),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(.8),
                    letterSpacing: 8,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              TimeFormatter.formatTimeWithWords(history.spentTime),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(.8),
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
