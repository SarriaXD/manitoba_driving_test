import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:manitoba_driving_test/shared/const/remote_url_const.dart';

import '../dto/question_dto.dart';

part 'question.freezed.dart';

@freezed
class Question with _$Question {
  factory Question({
    required int id,
    required String question,
    required String language,
    required List<Answer> answers,
    String? imageUrl,
    required String correctAnswerId,
    String? selectedAnswerId,
    @Default(false) bool isSubmitted,
  }) = _Question;
}

@freezed
class Answer with _$Answer {
  factory Answer({
    required String id,
    required int questionId,
    required String answer,
    required String message,
  }) = _Answer;
}

extension QuestionTransform on List<QuestionDTO> {
  List<Question> toQuestions() {
    final translation = expand((element) => element.translations);
    final entries = groupBy(translation, (trans) => trans.key);
    List<Question> quizzes = [];
    for (final entry in entries.entries) {
      for (final translation in entry.value) {
        final language = translation.value.lang == Key.EN ? 'en' : 'fr';
        final imageUrl = translation.value.imageUrl == ''
            ? null
            : '${RemoteUrlConst.mpiBase}${translation.value.imageUrl}';
        quizzes.add(
          Question(
              id: translation.value.id,
              question: translation.value.questionText,
              language: language,
              answers: translation.value.answers.toAnswers(),
              imageUrl: imageUrl,
              correctAnswerId: ""),
        );
      }
    }
    return quizzes;
  }
}

extension AnswerTransform on List<AnswerDTO> {
  List<Answer> toAnswers() {
    return map((answer) => Answer(
          id: answer.id,
          questionId: answer.questionId,
          answer: answer.answerText,
          message: answer.answerMessage,
        )).toList();
  }
}
