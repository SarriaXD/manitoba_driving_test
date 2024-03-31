import 'package:animated_visibility/animated_visibility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:manitoba_driving_test/shared/theme/colors.dart';

import '../../../quiz/models/question.dart';
import '../../../quiz/widgets/quiz/quiz_answer_list.dart';
import '../../../quiz/widgets/quiz/quiz_image.dart';

class QuizHistoryDetailItem extends StatefulWidget {
  const QuizHistoryDetailItem({
    super.key,
    required this.question,
    required this.expanded,
    required this.onExpand,
  });
  final Question question;
  final bool expanded;
  final Function(bool) onExpand;

  @override
  State<QuizHistoryDetailItem> createState() => _QuizHistoryDetailItemState();
}

class _QuizHistoryDetailItemState extends State<QuizHistoryDetailItem> {
  int _isAnimating = 0;
  BuildContext? _lastContext;

  // When expanded animation done, show the item to viewports
  void _animationComplete() {
    _isAnimating--;
    if (_isAnimating == 0 && _lastContext != null && mounted) {
      _lastContext
          ?.findRenderObject()
          ?.showOnScreen(duration: Durations.long1, curve: Curves.easeOutCubic);
    }
  }

  void _expandedStateChanged() {
    _isAnimating++;
    Future.delayed(Durations.long1 + 10.milliseconds, _animationComplete);
  }

  @override
  Widget build(BuildContext context) {
    _lastContext = context;
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.onExpand(!widget.expanded);
          _expandedStateChanged();
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.expanded
                ? Theme.of(context).colorScheme.onBackground.withOpacity(.23)
                : Theme.of(context).colorScheme.onBackground.withOpacity(.15),
            width: widget.expanded ? 1.6 : 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            _Question(
              question: widget.question,
              expanded: widget.expanded,
            ),
            _Content(
              question: widget.question,
              expanded: widget.expanded,
            ),
          ],
        ),
      ),
    );
  }
}

class _Question extends StatelessWidget {
  const _Question({
    required this.question,
    required this.expanded,
  });
  final Question question;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Durations.medium3,
      curve: Curves.easeOutCubic,
      decoration: BoxDecoration(
        color: expanded
            ? Theme.of(context).colorScheme.secondaryContainer.withOpacity(.4)
            : Theme.of(context).colorScheme.background,
        border: Border(
          bottom: BorderSide(
            color: expanded
                ? Theme.of(context).colorScheme.onBackground.withOpacity(.15)
                : Colors.transparent,
          ),
        ),
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(8),
          topRight: const Radius.circular(8),
          bottomLeft: expanded ? Radius.zero : const Radius.circular(8),
          bottomRight: expanded ? Radius.zero : const Radius.circular(8),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildQuestionIcon(context),
          const SizedBox(width: 16),
          Expanded(child: _buildText(context)),
          const SizedBox(width: 16),
          _buildExpandIcon(context),
        ],
      ),
    );
  }

  Widget _buildQuestionIcon(BuildContext context) {
    final isCorrect = question.correctAnswerId == question.selectedAnswerId;
    return Icon(
      isCorrect ? Icons.check_circle_outline : Icons.error_outline,
      color: isCorrect
          ? Theme.of(context).colorScheme.customGreenColor
          : Theme.of(context).colorScheme.error,
    );
  }

  Widget _buildText(BuildContext context) {
    return AnimatedDefaultTextStyle(
      duration: Durations.medium3,
      curve: Curves.easeOutCubic,
      style: expanded
          ? Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context)
                    .colorScheme
                    .onSecondaryContainer
                    .withOpacity(.8),
              )
          : Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context)
                    .colorScheme
                    .onSecondaryContainer
                    .withOpacity(.8),
              ),
      child: Text(question.question),
    );
  }

  Widget _buildExpandIcon(BuildContext context) {
    return AnimatedRotation(
      turns: expanded ? -.5 : 0,
      duration: Durations.medium3,
      curve: Curves.easeOutCubic,
      child: Icon(
        Icons.expand_more,
        color: Theme.of(context).colorScheme.onBackground.withOpacity(.8),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    required this.question,
    required this.expanded,
  });
  final Question question;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return AnimatedVisibility(
      visible: expanded,
      enter: fadeIn() +
          expandVertically(
            curve: Curves.easeOutCubic,
          ),
      exit: fadeOut() +
          shrinkVertically(
            curve: Curves.easeOutCubic,
          ),
      enterDuration: Durations.long1,
      exitDuration: Durations.medium1,
      child: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildImage(),
          _buildAnswers(),
          _buildIcon(context),
        ],
      ),
    );
  }

  Widget _buildImage() {
    if (question.imageUrl == null) {
      return const SizedBox();
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: QuizImage(
        imageUrl: question.imageUrl,
      ),
    );
  }

  Widget _buildAnswers() {
    return QuizAnswerList(
      answers: question.answers,
      isSubmitted: true,
      selectedAnswerId: question.selectedAnswerId,
      correctAnswerId: question.correctAnswerId,
      shouldPlayAnimationWhenSubmittedAndCorrect: false,
      onAnswerSelected: (id) {},
    );
  }

  Widget _buildIcon(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Icon(
        Icons.keyboard_arrow_up,
        size: 32,
        color: Theme.of(context).colorScheme.onSecondaryContainer,
      ),
    );
  }
}
