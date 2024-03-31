import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:manitoba_driving_test/features/quizzes_history/model/quiz_history.dart';

import '../../../../shared/animation/curve.dart';
import '../../../../shared/animation/list_item_transition.dart';
import '../../../../shared/widgets/diff_util_sliver_list.dart';
import 'quiz_finished_history_item.dart';
import 'quiz_unfinished_histories.dart';

class QuizHistoriesAnimatedList extends StatelessWidget {
  const QuizHistoriesAnimatedList({
    super.key,
    required this.scrollController,
    required this.unfinishedHistories,
    required this.finishedHistoriesOrDate,
    required this.isLoadingMore,
    required this.onReloadHistories,
    required this.onHistoryRemoved,
  });
  final ScrollController scrollController;
  final List<QuizHistory> unfinishedHistories;
  final List<FinishedQuizHistoryOrDate> finishedHistoriesOrDate;
  final bool isLoadingMore;
  final Function onReloadHistories;
  final Function(int) onHistoryRemoved;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        _buildContinueTitle(context),
        SliverToBoxAdapter(
          child: QuizUnfinishedHistories(
            histories: unfinishedHistories,
            onReloadHistories: onReloadHistories,
          ),
        ),
        _buildHistoryTitle(context, finishedHistoriesOrDate.length),
        _buildList(),
        if (finishedHistoriesOrDate.isEmpty)
          const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: _NoHistory()),
          ),
        if (isLoadingMore)
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child: Center(child: CircularProgressIndicator()),
            ),
          ),
      ],
    );
  }

  Widget _buildContinueTitle(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 32,
      expandedHeight: 56,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        titlePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        expandedTitleScale: 1.2,
        title: Text(
          'Continue',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
                color:
                    Theme.of(context).colorScheme.onBackground.withOpacity(.8),
              ),
        ),
      ),
    );
  }

  Widget _buildHistoryTitle(BuildContext context, int displayCount) {
    return SliverAppBar(
      primary: true,
      toolbarHeight: 40,
      expandedHeight: 56,
      pinned: true,
      surfaceTintColor:
          Theme.of(context).colorScheme.background.withOpacity(.92),
      backgroundColor:
          Theme.of(context).colorScheme.background.withOpacity(.92),
      elevation: 4,
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: FlexibleSpaceBar(
            centerTitle: false,
            titlePadding: const EdgeInsets.symmetric(horizontal: 16),
            expandedTitleScale: 1.2,
            title: Text(
              'History',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(.8),
                  ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildList() {
    return DiffUtilSliverList(
      items: finishedHistoriesOrDate,
      itemBuilder: (context, _, animation, item) {
        return _buildFinishedHistoryInsetAnimation(
          context,
          animation,
          item,
        );
      },
      onRemoveItem: (context, index, animation, item) {
        return _buildHistoryDateRemoveAnimation(
          item,
          context,
          animation,
        );
      },
      insertAnimationDuration: _animationDuration,
      equalityChecker: _equalityChecker,
    );
  }

  bool _equalityChecker(
    FinishedQuizHistoryOrDate a,
    FinishedQuizHistoryOrDate b,
  ) {
    if (a is FinishedQuizHistoryDate && b is FinishedQuizHistoryDate) {
      return a.dateStr == b.dateStr;
    } else if (a is FinishedQuizHistoryItem && b is FinishedQuizHistoryItem) {
      return a.quizHistory.id == b.quizHistory.id;
    }
    return false;
  }

  Widget _buildFinishedHistoryInsetAnimation(
    BuildContext context,
    Animation<double> animation,
    FinishedQuizHistoryOrDate item,
  ) {
    final child = switch (item) {
      FinishedQuizHistoryDate() => _buildFinishedHistoryDate(item, context),
      FinishedQuizHistoryItem() => _buildFinishedHistoryItem(item),
    };
    return ListItemTransition(
      curve: CustomAddCurve(
        heroDuration: Durations.long3.inMilliseconds,
        addDuration: _animationDuration.inMilliseconds,
        expectedCurve: Curves.easeOutCubic,
      ),
      animation: animation,
      axis: Axis.vertical,
      child: child,
    );
  }

  Widget _buildHistoryDateRemoveAnimation(
    FinishedQuizHistoryOrDate item,
    BuildContext context,
    Animation<double> animation,
  ) {
    if (item is FinishedQuizHistoryDate) {
      return ListItemTransition(
        curve: Curves.easeInCubic,
        animation: animation,
        axis: Axis.vertical,
        child: _buildFinishedHistoryDate(item, context),
      );
    }
    return const SizedBox();
  }

  Widget _buildFinishedHistoryItem(FinishedQuizHistoryItem item) {
    return QuizFinishedHistoryItem(
      history: item.quizHistory,
      onRemove: onHistoryRemoved,
    );
  }

  Widget _buildFinishedHistoryDate(
    FinishedQuizHistoryDate date,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: 16,
      ),
      child: Text(
        date.dateStr,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onBackground.withOpacity(.6),
            ),
      ),
    );
  }

  Duration get _animationDuration => Durations.long3 + Durations.extralong1;
}

class _NoHistory extends StatelessWidget {
  const _NoHistory();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'No history found',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color:
                    Theme.of(context).colorScheme.onBackground.withOpacity(.8),
              ),
        ),
        Lottie.asset(
          repeat: false,
          'assets/animations/lottie_quiz_history_not_found.json',
        ),
      ]
          .animate(interval: Durations.medium1)
          .fadeIn(duration: Durations.long4, curve: Curves.easeOutCubic)
          .slideY(
              duration: Durations.long4, begin: 1, curve: Curves.easeOutCubic),
    );
  }
}
