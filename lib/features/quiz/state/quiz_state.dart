import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:manitoba_driving_test/features/quiz/models/question.dart';

part 'quiz_state.freezed.dart';

@freezed
class QuizState with _$QuizState {
  factory QuizState({
    @Default(0) int spendTime,
    @Default([]) List<Question> questions,
  }) = _QuizState;
}
