import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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

class QuizQuestionScreen extends HookConsumerWidget {
  const QuizQuestionScreen({
    super.key,
    required this.historyId,
    required this.onNavigateToResultScreen,
  });
  final int? historyId;
  final Function(int) onNavigateToResultScreen;

  void _userScrollListener(
      ScrollController scrollController, ValueNotifier<bool> isButtonVisible) {
    useEffect(() {
      void listener() {
        if (scrollController.position.userScrollDirection ==
            ScrollDirection.reverse) {
          if (isButtonVisible.value) {
            isButtonVisible.value = false;
          }
        } else if (scrollController.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (!isButtonVisible.value) {
            isButtonVisible.value = true;
          }
        }
      }

      scrollController.addListener(listener);
      return () => scrollController.removeListener(listener);
    }, [scrollController]);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isButtonVisible = useState(true);
    final currentQuestionIndex = useState(0);
    final scrollController = useScrollController();
    _userScrollListener(scrollController, isButtonVisible);
    ref.listen(
      quizViewModelProvider(historyId),
      (previous, next) {
        listener(previous, next, currentQuestionIndex);
      },
    );
    final questions = ref.watch(
        quizViewModelProvider(historyId).select((value) => value.questions));
    return PopScope(
      canPop: false,
      onPopInvoked: (canPop) async {
        if (!canPop) {
          await ref
              .read(quizViewModelProvider(historyId).notifier)
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
                    ref: ref,
                    currentQuestionIndex: currentQuestionIndex,
                    context: context,
                    question: questions[currentQuestionIndex.value],
                    questionIndex: currentQuestionIndex.value,
                    questionSize: questions.length,
                  ),
          ),
        ),
        floatingActionButton: isButtonVisible.value && questions.isNotEmpty
            ? QuizFloatingActionButton(
                isLastQuestion: currentQuestionIndex == questions.length - 1,
                isSubmitted: questions[currentQuestionIndex.value].isSubmitted,
                isAnswerSelected:
                    questions[currentQuestionIndex.value].selectedAnswerId !=
                        null,
                onSubmitted: () => ref
                    .read(quizViewModelProvider(historyId).notifier)
                    .onAnswerSubmitted(currentQuestionIndex.value),
                onNext: () {
                  currentQuestionIndex.value++;
                },
                onFinished: () async {
                  final historyId = await ref
                      .read(quizViewModelProvider(this.historyId).notifier)
                      .saveHistory();
                  onNavigateToResultScreen(historyId);
                },
              )
            : null,
      ),
    );
  }

  void listener(QuizState? previous, QuizState next,
      ValueNotifier<int> currentQuestionIndex) {
    // when data comes, show first unSubmitted question
    if (previous != null &&
        previous.questions.isEmpty &&
        next.questions.isNotEmpty) {
      final index =
          next.questions.indexWhere((element) => !element.isSubmitted);
      if (index != -1) {
        currentQuestionIndex.value = index;
      }
    }
  }

  Widget _buildLoadingShimmer() {
    return const QuizQuestionLoadingShimmer();
  }

  Widget _buildQuestion({
    required BuildContext context,
    required Question question,
    required int questionIndex,
    required int questionSize,
    required WidgetRef ref,
    required ValueNotifier<int> currentQuestionIndex,
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
              historyId: historyId,
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
                    .read(quizViewModelProvider(historyId).notifier)
                    .onAnswerSelected(currentQuestionIndex.value, id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
