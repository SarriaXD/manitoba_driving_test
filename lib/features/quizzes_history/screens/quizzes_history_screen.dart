import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manitoba_driving_test/features/quizzes_history/viewmodel/quiz_history_viewmodel.dart';

import '../widgets/quiz_history/quiz_histories_animated_list.dart';

class QuizzesHistoryScreen extends ConsumerStatefulWidget {
  const QuizzesHistoryScreen({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  ConsumerState<QuizzesHistoryScreen> createState() =>
      _QuizzesHistoryScreenState();
}

class _QuizzesHistoryScreenState extends ConsumerState<QuizzesHistoryScreen>
    with AutomaticKeepAliveClientMixin {
  var canTriggerLoadMore = true;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(() async {
      if (widget.scrollController.position.pixels >
              widget.scrollController.position.maxScrollExtent + 50 &&
          canTriggerLoadMore) {
        canTriggerLoadMore = false;
        await ref
            .read(quizHistoryViewModelProvider(
                    FirebaseAuth.instance.currentUser?.uid)
                .notifier)
            .loadMore();
        // Delay 3 second to prevent multiple trigger
        Future.delayed(const Duration(seconds: 2), () {
          canTriggerLoadMore = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final state = ref.watch(
        quizHistoryViewModelProvider(FirebaseAuth.instance.currentUser?.uid));
    if (state.isFirstLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return QuizHistoriesAnimatedList(
      scrollController: widget.scrollController,
      unfinishedHistories: state.unfinishedHistories,
      finishedHistoriesOrDate: state.finishedHistoriesOrDate,
      isLoadingMore: state.isLoadingMore,
      onReloadHistories: _onReloadHistories,
      onHistoryRemoved: _onHistoryRemoved,
    );
  }

  void _onReloadHistories() {
    ref
        .read(
            quizHistoryViewModelProvider(FirebaseAuth.instance.currentUser?.uid)
                .notifier)
        .reloadHistories();
  }

  void _onHistoryRemoved(int historyId) {
    ref
        .read(
            quizHistoryViewModelProvider(FirebaseAuth.instance.currentUser?.uid)
                .notifier)
        .removeHistory(historyId);
  }

  @override
  bool get wantKeepAlive => true;
}
