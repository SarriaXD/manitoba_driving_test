import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';

class QuizFloatingActionButton extends StatelessWidget {
  const QuizFloatingActionButton({
    super.key,
    required this.onFinished,
    required this.isAnswerSelected,
    required this.isLastQuestion,
    required this.isSubmitted,
    required this.onSubmitted,
    required this.onNext,
  });
  final Function() onFinished;
  final bool isAnswerSelected;
  final bool isLastQuestion;
  final bool isSubmitted;
  final Function() onSubmitted;
  final Function() onNext;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
      backgroundColor: isAnswerSelected
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.primaryContainer,
      foregroundColor: isAnswerSelected
          ? Theme.of(context).colorScheme.onPrimary
          : Theme.of(context).colorScheme.onPrimaryContainer,
      onPressed: isAnswerSelected
          ? () => EasyDebounce.debounce(
                  'quiz_question_button_click', Durations.medium1, () {
                _onButtonPressed(isSubmitted, isLastQuestion);
              })
          : null,
      icon: AnimatedSwitcher(
        duration: Durations.medium1,
        reverseDuration: Durations.medium1,
        child: _buildButtonIcon(isSubmitted, isLastQuestion),
        transitionBuilder: (child, animation) {
          return ScaleTransition(scale: animation, child: child);
        },
      ),
      label: AnimatedSize(
        duration: Durations.medium1,
        curve: Curves.bounceInOut,
        child: _buildButtonText(isSubmitted, isLastQuestion),
      ),
    );
  }

  Widget _buildButtonIcon(bool isAnswered, bool isLastQuestion) {
    final buttonState = _getButtonState(isAnswered, isLastQuestion);
    switch (buttonState) {
      case _ButtonState.submit:
        return const Icon(key: ValueKey('submit'), Icons.check);
      case _ButtonState.next:
        return const Icon(key: ValueKey('next'), Icons.arrow_forward);
      case _ButtonState.finish:
        return const Icon(key: ValueKey('finish'), Icons.done_all);
    }
  }

  Widget _buildButtonText(bool isAnswered, bool isLastQuestion) {
    final buttonState = _getButtonState(isAnswered, isLastQuestion);
    switch (buttonState) {
      case _ButtonState.submit:
        return const Text('Submit');
      case _ButtonState.next:
        return const Text('Next');
      case _ButtonState.finish:
        return const Text('Finish');
    }
  }

  void _onButtonPressed(bool isAnswered, bool isLastQuestion) {
    final buttonState = _getButtonState(isAnswered, isLastQuestion);
    switch (buttonState) {
      case _ButtonState.submit:
        onSubmitted();
        break;
      case _ButtonState.next:
        onNext();
        break;
      case _ButtonState.finish:
        onFinished();
        break;
    }
  }

  _ButtonState _getButtonState(bool isAnswered, bool isLastQuestion) {
    if (isAnswered) {
      if (isLastQuestion) {
        return _ButtonState.finish;
      } else {
        return _ButtonState.next;
      }
    } else {
      return _ButtonState.submit;
    }
  }
}

enum _ButtonState { submit, next, finish }
