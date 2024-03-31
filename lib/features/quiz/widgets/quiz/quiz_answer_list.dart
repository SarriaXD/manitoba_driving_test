import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manitoba_driving_test/features/quiz/widgets/quiz/quiz_answer_item.dart';

import '../../models/question.dart';

class QuizAnswerList extends ConsumerWidget {
  const QuizAnswerList(
      {super.key,
      required this.answers,
      required this.isSubmitted,
      required this.onAnswerSelected,
      required this.selectedAnswerId,
      required this.correctAnswerId,
      this.shouldPlayAnimationWhenSubmittedAndCorrect = true});
  final List<Answer> answers;
  final bool isSubmitted;
  final String? selectedAnswerId;
  final String correctAnswerId;
  final bool shouldPlayAnimationWhenSubmittedAndCorrect;
  final Function(String answerId) onAnswerSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ...answers.mapIndexed(
          (index, element) => QuizAnswerItem(
            answerState: getAnswerState(element),
            message: getAnswerMessage(element),
            answer: element.answer,
            isEnable: !isSubmitted,
            onSelected: () => onAnswerSelected(element.id),
            alphabet: ["A:", "B:", "C:", "D:"][index],
            playAnimation: shouldPlayAnimationWhenSubmittedAndCorrect &&
                isSubmitted &&
                element.id == selectedAnswerId &&
                element.id == correctAnswerId,
          ),
        )
      ],
    );
  }

  AnswerState getAnswerState(Answer answer) {
    if ((!isSubmitted && answer.id == selectedAnswerId) ||
        (isSubmitted && answer.id == correctAnswerId)) {
      return AnswerState.highlight;
    }
    if (isSubmitted &&
        answer.id == selectedAnswerId &&
        answer.id != correctAnswerId) {
      return AnswerState.error;
    }
    return AnswerState.normal;
  }

  String? getAnswerMessage(Answer answer) {
    if (isSubmitted && answer.id == correctAnswerId) {
      return answer.message;
    }
    return null;
  }
}
