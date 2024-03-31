import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manitoba_driving_test/features/quizzes_history/model/quiz_history.dart';
import 'package:manitoba_driving_test/features/quizzes_history/repository/quizzes_history_repository.dart';

import '../../../shared/logger/logger.dart';
import '../state/quiz_history_state.dart';

class QuizHistoryViewModel extends StateNotifier<QuizHistoryState> {
  QuizHistoryViewModel(this.repository) : super(QuizHistoryState()) {
    fullLoading(isFirstLoading: true);
  }
  final QuizzesHistoryRepository repository;
  final limit = 50;
  var currentOffset = 0;

  Future<void> fullLoading({required bool isFirstLoading}) async {
    try {
      state = state.copyWith(isFirstLoading: isFirstLoading);
      final unfinishedHistories = await repository.getUnfinishedHistories();
      final finishedHistories = await repository.getFinishedHistories(
        offset: 0,
        limit: limit,
      );
      final finishedHistoriesOrDate =
          await _transformToUnfinishedHistoriesOrDate(finishedHistories);
      state = state.copyWith(
        unfinishedHistories: unfinishedHistories,
        finishedHistories: finishedHistories,
        finishedHistoriesOrDate: finishedHistoriesOrDate,
      );
      currentOffset = finishedHistories.length;
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
      logger.e(e);
    } finally {
      state = state.copyWith(isFirstLoading: false);
    }
  }

  Future<void> loadMore() async {
    if (state.isLoadingMore) {
      return;
    }
    state = state.copyWith(
      isLoadingMore: true,
    );
    try {
      // ensure that loading time is not too fast, it should be at least 1 second
      final currentTime = DateTime.now();
      final newFinishedHistories = await repository.getFinishedHistories(
        offset: currentOffset,
        limit: limit,
      );
      final diff = DateTime.now().difference(currentTime);
      if (diff.inMilliseconds < 1000) {
        await Future.delayed(
            Duration(milliseconds: 1000 - diff.inMilliseconds));
      }
      final finishedHistories = state.finishedHistories + newFinishedHistories;
      final finishedHistoriesOrDate =
          await _transformToUnfinishedHistoriesOrDate(finishedHistories);
      state = state.copyWith(
        finishedHistories: finishedHistories,
        finishedHistoriesOrDate: finishedHistoriesOrDate,
      );
      currentOffset = state.finishedHistories.length;
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
      logger.e(e);
    } finally {
      state = state.copyWith(
        isLoadingMore: false,
      );
    }
  }

  Future<void> reloadHistories() async {
    currentOffset = 0;
    await fullLoading(isFirstLoading: false);
  }

  Future<void> removeHistory(int historyId) async {
    final newHistories = state.finishedHistories
        .where((element) => element.id != historyId)
        .toList();
    final isSuccess = await repository.removeHistory(historyId);
    if (isSuccess) {
      final newHistoriesOrDate =
          await _transformToUnfinishedHistoriesOrDate(newHistories);
      state = state.copyWith(
        finishedHistories: newHistories,
        finishedHistoriesOrDate: newHistoriesOrDate,
      );
    }
  }

  Future<List<FinishedQuizHistoryOrDate>> _transformToUnfinishedHistoriesOrDate(
      List<QuizHistory> unfinishedHistories) async {
    return await compute(_processUnfinishedHistories, unfinishedHistories);
  }
}

List<FinishedQuizHistoryOrDate> _processUnfinishedHistories(
    List<QuizHistory> finishedHistories) {
  List<FinishedQuizHistoryOrDate> result = [];
  // for index
  for (int index = 0; index < finishedHistories.length; index++) {
    final element = finishedHistories[index];
    if (index == 0) {
      result.add(FinishedQuizHistoryDate(_groupDate(element.updateTime)));
      result.add(FinishedQuizHistoryItem(element));
    } else {
      final previousTime = finishedHistories[index - 1].updateTime;
      final currentTime = element.updateTime;
      final previousGroupDate = _groupDate(previousTime);
      final currentGroupDate = _groupDate(currentTime);
      if (previousGroupDate != currentGroupDate) {
        result.add(FinishedQuizHistoryDate(currentGroupDate));
      }
      result.add(FinishedQuizHistoryItem(element));
    }
  }
  return result;
}

String _groupDate(DateTime date) {
  final now = DateTime.now();
  final dateDiff = now.difference(date).inDays;
  if (dateDiff < 1) {
    return 'Today';
  }
  if (dateDiff < 2) {
    return 'Yesterday';
  }
  if (dateDiff < 7) {
    return '$dateDiff days ago';
  }
  if (dateDiff < 27) {
    return '${dateDiff ~/ 7} weeks ago';
  }
  if (dateDiff < 60) {
    return '1 months ago';
  }
  if (dateDiff < 359) {
    return '${dateDiff ~/ 30} months ago';
  }
  if (dateDiff < 730) {
    return '1 year ago';
  }
  return '${dateDiff ~/ 365} years ago';
}

final quizHistoryViewModelProvider = StateNotifierProvider.autoDispose
    .family<QuizHistoryViewModel, QuizHistoryState, String?>(
  (ref, uid) =>
      QuizHistoryViewModel(ref.watch(quizzesHistoryRepositoryProvider(uid))),
);
