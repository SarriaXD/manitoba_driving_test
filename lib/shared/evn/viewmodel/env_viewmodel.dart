import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manitoba_driving_test/features/quiz/repository/quiz_repository.dart';
import 'package:manitoba_driving_test/features/quizzes_history/repository/quizzes_history_repository.dart';

import '../../../features/quiz/models/question.dart';
import '../state/env_state.dart';

class EnvViewModel extends StateNotifier<EnvState> {
  EnvViewModel(this.historyRepository, this.quizRepository)
      : super(EnvState()) {
    _updateState();
  }
  final QuizzesHistoryRepository historyRepository;
  final QuizRepository quizRepository;

  Future<void> generateHistories({
    required int finishedQuantity,
    required int unFinishedQuantity,
  }) async {
    state = state.copyWith(isLoading: true);
    final templateQuestions = await quizRepository.getQuestions(20);
    await _generateHistories(
      quantity: finishedQuantity,
      questionGenerator: () => _generateFinishedQuestions(templateQuestions),
    );
    await _generateHistories(
      quantity: unFinishedQuantity,
      questionGenerator: () => _generateUnfinishedQuestions(templateQuestions),
    );
    await _updateState();
    state = state.copyWith(isLoading: false);
  }

  Future<void> clearHistories() async {
    state = state.copyWith(isLoading: true);
    await historyRepository.clearHistories();
    await _updateState();
    state = state.copyWith(isLoading: false);
  }

  Future<void> _updateState() async {
    final unfinishedCount =
        await historyRepository.getUnfinishedHistoriesCount();
    final finishedCount = await historyRepository.getFinishedHistoriesCount();
    state = state.copyWith(
      unfinishedCount: unfinishedCount,
      finishedCount: finishedCount,
    );
  }

  Future<void> _generateHistories({
    required int quantity,
    required List<Question> Function() questionGenerator,
  }) async {
    for (int i = 0; i < quantity; i++) {
      final random = Random();
      final spendTime = random.nextInt(1000);
      final finishedQuestions = questionGenerator();
      await historyRepository.saveQuizHistory(
        questions: finishedQuestions,
        spendTime: spendTime,
        createTime: _randomDate(i),
      );
    }
  }

  DateTime _randomDate(int index) {
    final random = Random();
    return DateTime.now().subtract(
      Duration(
        days: index,
        minutes: random.nextInt(60),
      ),
    );
  }

  List<Question> _generateFinishedQuestions(List<Question> templateQuestions) {
    return templateQuestions.map((question) {
      return _answerQuestion(question);
    }).toList();
  }

  List<Question> _generateUnfinishedQuestions(
      List<Question> templateQuestions) {
    final random = Random();
    int randomIndex = random.nextInt(templateQuestions.length - 1);
    return templateQuestions.mapIndexed((index, question) {
      if (index >= randomIndex) {
        return question;
      }
      return _answerQuestion(question);
    }).toList();
  }

  Question _answerQuestion(Question question) {
    final random = Random();
    int randomIndex = random.nextInt(question.answers.length);
    final randomAnswer = question.answers[randomIndex];
    return question.copyWith(
      selectedAnswerId: randomAnswer.id,
      isSubmitted: true,
    );
  }
}

final envViewModelProvider = StateNotifierProvider.autoDispose
    .family<EnvViewModel, EnvState, String?>((ref, uid) {
  final historyRepository = ref.watch(quizzesHistoryRepositoryProvider(uid));
  final quizRepository = ref.watch(quizRepositoryProvider);
  return EnvViewModel(historyRepository, quizRepository);
});
