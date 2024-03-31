import 'package:flutter/material.dart';
import 'package:manitoba_driving_test/features/quiz/widgets/quiz/quiz_time_tick.dart';

class QuizQuestion extends StatelessWidget {
  const QuizQuestion({
    super.key,
    required this.questionIndex,
    required this.question,
    required this.questionSize,
    this.historyId,
  });
  final int questionIndex;
  final int questionSize;
  final String question;
  final int? historyId;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Question ${questionIndex + 1} of $questionSize',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(.6),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            QuizTimeTick(historyId: historyId),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          question,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground.withOpacity(.8),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
