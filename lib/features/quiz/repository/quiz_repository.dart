import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manitoba_driving_test/features/quiz/models/question.dart';
import 'package:manitoba_driving_test/shared/settings/provider/user_settings_provider.dart';

import '../datasource/quiz_remote_datasource.dart';

class QuizRepository {
  final QuizRemoteDatasource remote;
  final String language;

  QuizRepository({required this.remote, required this.language});

  Future<List<Question>> getQuestions(int questionQty) async {
    final questions = await remote.getQuestions(questionQty);
    final filteredQuestions = questions.toQuestions().where((element) {
      return element.language == language;
    }).toList();
    return await _validateAllAnswers(filteredQuestions);
  }

  // can be used to preload the answer result for better user experience
  Future<Question> _validateAnswer(Question question) async {
    final random = Random();
    int randomIndex = random.nextInt(question.answers.length);
    final randomAnswer = question.answers[randomIndex];
    final validationResult = await remote.validateAnswer(randomAnswer.id);
    final correctAnswerId = validationResult.answerId;
    return question.copyWith(
      correctAnswerId: correctAnswerId,
    );
  }

  Future<List<Question>> _validateAllAnswers(List<Question> questions) async {
    return await Future.wait(
      questions.map((question) {
        return _validateAnswer(question);
      }),
    );
  }
}

final quizRepositoryProvider = Provider<QuizRepository>(
  (ref) {
    final language = ref.watch(
        userSettingsProvider.select((value) => value.systemSettings.language));
    return QuizRepository(
      remote: ref.watch(quizzesRemoteDatasourceProvider),
      language: language,
    );
  },
);
