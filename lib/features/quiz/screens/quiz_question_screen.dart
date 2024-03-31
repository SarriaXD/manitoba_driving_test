import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manitoba_driving_test/features/quiz/events/quiz_pop_event.dart';
import 'package:manitoba_driving_test/features/quiz/models/question.dart';
import 'package:manitoba_driving_test/features/quiz/viewmodel/quiz_viewmodel.dart';
import 'package:manitoba_driving_test/features/quiz/widgets/quiz/quiz_answer_list.dart';
import 'package:manitoba_driving_test/features/quiz/widgets/quiz/quiz_image.dart';
import 'package:manitoba_driving_test/features/quiz/widgets/quiz/quiz_question_loading_shimmer.dart';

import '../../../shared/widgets/dark_mode_switch_button.dart';
import '../state/quiz_state.dart';
import '../widgets/quiz/quiz_floating_action_button.dart';
import '../widgets/quiz/quiz_question.dart';

class QuizQuestionScreen extends ConsumerStatefulWidget {
  const QuizQuestionScreen({
    super.key,
    required this.historyId,
    required this.onNavigateToResultScreen,
  });
  final int? historyId;
  final Function(int) onNavigateToResultScreen;

  @override
  ConsumerState<QuizQuestionScreen> createState() => _QuizQuestionScreenState();
}

class _QuizQuestionScreenState extends ConsumerState<QuizQuestionScreen> {
  var isButtonVisible = true;
  final scrollController = ScrollController();
  var currentQuestionIndex = 0;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (isButtonVisible) {
          setState(() {
            isButtonVisible = false;
          });
        }
      } else if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!isButtonVisible) {
          setState(() {
            isButtonVisible = true;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      quizViewModelProvider(widget.historyId),
      listener,
    );
    final questions = ref.watch(quizViewModelProvider(widget.historyId)
        .select((value) => value.questions));
    return PopScope(
      canPop: false,
      onPopInvoked: (canPop) async {
        if (!canPop) {
          final historyId = await ref
              .read(quizViewModelProvider(widget.historyId).notifier)
              .saveHistory();
          if (context.mounted) {
            Navigator.of(context).pop(QuizPopEvent.reloadHistories);
          }
        }
      },
      child: Scaffold(
        body: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              const SliverAppBar(
                leading: CloseButton(),
                actions: [
                  DarkModeSwitchButton(),
                ],
              ),
            ];
          },
          body: AnimatedSwitcher(
            duration: Durations.long3,
            switchInCurve: Curves.fastLinearToSlowEaseIn,
            switchOutCurve: Curves.fastOutSlowIn,
            transitionBuilder: (child, animation) {
              final tween = Tween<double>(
                begin: 0.9,
                end: 1.0,
              ).animate(animation);
              return ScaleTransition(
                scale: tween,
                child: child,
              );
            },
            layoutBuilder: (currentChild, previousChildren) {
              return currentChild!;
            },
            child: questions.isEmpty
                ? _buildLoadingShimmer()
                : _buildQuestion(
                    question: questions[currentQuestionIndex],
                    questionIndex: currentQuestionIndex,
                    questionSize: questions.length,
                  ),
          ),
        ),
        floatingActionButton: isButtonVisible && questions.isNotEmpty
            ? QuizFloatingActionButton(
                isLastQuestion: currentQuestionIndex == questions.length - 1,
                isSubmitted: questions[currentQuestionIndex].isSubmitted,
                isAnswerSelected:
                    questions[currentQuestionIndex].selectedAnswerId != null,
                onSubmitted: () => ref
                    .read(quizViewModelProvider(widget.historyId).notifier)
                    .onAnswerSubmitted(currentQuestionIndex),
                onNext: () {
                  setState(() {
                    currentQuestionIndex++;
                  });
                },
                onFinished: () async {
                  final historyId = await ref
                      .read(quizViewModelProvider(widget.historyId).notifier)
                      .saveHistory();
                  widget.onNavigateToResultScreen(historyId);
                },
              )
            : null,
      ),
    );
  }

  void listener(QuizState? previous, QuizState next) {
    // when data comes, show first unSubmitted question
    if (previous != null &&
        previous.questions.isEmpty &&
        next.questions.isNotEmpty) {
      final index =
          next.questions.indexWhere((element) => !element.isSubmitted);
      if (index != -1) {
        setState(() {
          currentQuestionIndex = index;
        });
      }
    }
  }

  Widget _buildLoadingShimmer() {
    return const QuizQuestionLoadingShimmer();
  }

  Widget _buildQuestion({
    required Question question,
    required int questionIndex,
    required int questionSize,
  }) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            QuizQuestion(
              question: question.question,
              questionIndex: questionIndex,
              questionSize: questionSize,
              historyId: widget.historyId,
            ),
            const SizedBox(height: 16),
            QuizImage(
              imageUrl: question.imageUrl,
            ),
            const SizedBox(height: 16),
            QuizAnswerList(
              key: ValueKey(questionIndex),
              selectedAnswerId: question.selectedAnswerId,
              correctAnswerId: question.correctAnswerId,
              isSubmitted: question.isSubmitted,
              answers: question.answers,
              onAnswerSelected: (id) {
                ref
                    .read(quizViewModelProvider(widget.historyId).notifier)
                    .onAnswerSelected(currentQuestionIndex, id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
