import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:manitoba_driving_test/features/quizzes_history/viewmodel/quiz_history_viewmodel.dart';

import '../widgets/quiz_history/quiz_histories_animated_list.dart';

class QuizzesHistoryScreen extends HookConsumerWidget {
  const QuizzesHistoryScreen({super.key, required this.scrollController});
  final ScrollController scrollController;

  void userScrollListener(
    WidgetRef ref,
    ObjectRef<bool> canTriggerLoadMore,
  ) {
    useEffect(() {
      void listener() async {
        if (scrollController.position.pixels >
                scrollController.position.maxScrollExtent + 50 &&
            canTriggerLoadMore.value) {
          canTriggerLoadMore.value = false;
          await ref
              .read(quizHistoryViewModelProvider(
                      FirebaseAuth.instance.currentUser?.uid)
                  .notifier)
              .loadMore();
          // Delay 3 second to prevent multiple trigger
          Future.delayed(const Duration(seconds: 2), () {
            canTriggerLoadMore.value = true;
          });
        }
      }

      scrollController.addListener(listener);
      return () => scrollController.removeListener(listener);
    }, [scrollController]);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useAutomaticKeepAlive(wantKeepAlive: true);
    final canTriggerLoadMore = useRef(true);
    userScrollListener(ref, canTriggerLoadMore);
    final state = ref.watch(
        quizHistoryViewModelProvider(FirebaseAuth.instance.currentUser?.uid));
    if (state.isFirstLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return QuizHistoriesAnimatedList(
        scrollController: scrollController,
        unfinishedHistories: state.unfinishedHistories,
        finishedHistoriesOrDate: state.finishedHistoriesOrDate,
        isLoadingMore: state.isLoadingMore,
        onReloadHistories: _onReloadHistories,
        onHistoryRemoved: (historyId) => _onHistoryRemoved(ref, historyId));
  }

  void _onReloadHistories(WidgetRef ref) {
    ref
        .read(
            quizHistoryViewModelProvider(FirebaseAuth.instance.currentUser?.uid)
                .notifier)
        .reloadHistories();
  }

  void _onHistoryRemoved(WidgetRef ref, int historyId) {
    ref
        .read(
            quizHistoryViewModelProvider(FirebaseAuth.instance.currentUser?.uid)
                .notifier)
        .removeHistory(historyId);
  }
}
