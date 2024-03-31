import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/quiz_history.dart';

part 'quiz_history_state.freezed.dart';

@freezed
class QuizHistoryState with _$QuizHistoryState {
  factory QuizHistoryState({
    @Default([]) List<QuizHistory> unfinishedHistories,
    @Default([]) List<QuizHistory> finishedHistories,
    @Default([]) List<FinishedQuizHistoryOrDate> finishedHistoriesOrDate,
    @Default(false) bool isFirstLoading,
    @Default(false) bool isLoadingMore,
    String? errorMessage,
  }) = _QuizHistoryState;
}
