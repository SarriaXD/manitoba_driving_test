import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_history.freezed.dart';

@freezed
class QuizHistory with _$QuizHistory {
  factory QuizHistory({
    required int id,
    required DateTime createTime,
    required DateTime updateTime,
    required String language,
    required int correctSize,
    required int totalSize,
    required int submittedSize,
    required bool isFinished,
    required int spentTime,
  }) = _QuizHistory;
}

sealed class FinishedQuizHistoryOrDate {}

class FinishedQuizHistoryDate extends FinishedQuizHistoryOrDate {
  final String dateStr;
  FinishedQuizHistoryDate(this.dateStr);
}

class FinishedQuizHistoryItem extends FinishedQuizHistoryOrDate {
  final QuizHistory quizHistory;
  FinishedQuizHistoryItem(this.quizHistory);
}
