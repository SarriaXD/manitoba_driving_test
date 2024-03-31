import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manitoba_driving_test/features/quiz/repository/quiz_repository.dart';
import 'package:manitoba_driving_test/features/quiz/state/quiz_state.dart';
import 'package:manitoba_driving_test/features/quizzes_history/repository/quizzes_history_repository.dart';
import 'package:manitoba_driving_test/shared/logger/logger.dart';

import '../../../shared/settings/provider/user_settings_provider.dart';

class QuizViewModel extends StateNotifier<QuizState> {
  QuizViewModel(
      {required this.historyId,
      required this.quizRepository,
      required this.questionQty,
      required this.quizzesHistoryRepository})
      : super(QuizState()) {
    if (historyId == null) {
      getQuizzesFromRemote();
    } else {
      getQuizzesFromHistory();
    }
  }
  final QuizRepository quizRepository;
  final QuizzesHistoryRepository quizzesHistoryRepository;
  final int questionQty;
  final int? historyId;

  void getQuizzesFromHistory() async {
    try {
      final questions =
          await quizzesHistoryRepository.getHistoryQuestions(historyId!);
      final spendTime = await quizzesHistoryRepository
          .getHistory(historyId!)
          .then((value) => value?.spentTime);
      state = state.copyWith(
        questions: questions,
        spendTime: spendTime ?? 0,
      );
    } catch (e) {
      logger.e(e);
    }
  }

  void getQuizzesFromRemote() async {
    try {
      final questions = await quizRepository.getQuestions(questionQty);
      state = state.copyWith(questions: questions);
    } catch (e) {
      logger.e(e);
    }
  }

  // unnecessary to update state,
  // but the method will only be called every second, this is fine for keeping the code clean and consistent
  void onTimeChanged(int time) {
    state = state.copyWith(spendTime: time);
  }

  void onAnswerSelected(int questionIndex, String answerId) {
    try {
      final currentQuestion = state.questions[questionIndex];
      final updatedQuestions = state.questions.map((question) {
        if (question.id == currentQuestion.id) {
          return question.copyWith(
            selectedAnswerId: answerId,
          );
        } else {
          return question;
        }
      }).toList();
      state = state.copyWith(questions: updatedQuestions);
    } catch (e) {
      logger.e(e);
    }
  }

  void onAnswerSubmitted(int questionIndex) async {
    try {
      final currentQuestion = state.questions[questionIndex];
      if (currentQuestion.selectedAnswerId == null) {
        return;
      }
      final questions = state.questions.map((question) {
        if (question.id == currentQuestion.id) {
          return question.copyWith(
            isSubmitted: true,
          );
        }
        return question;
      }).toList();
      state = state.copyWith(questions: questions);
    } catch (e) {
      logger.e(e);
    }
  }

  Future<int> saveHistory() async {
    if (state.questions.isEmpty) {
      return -1;
    }
    if (historyId != null) {
      return quizzesHistoryRepository.updateQuizHistory(
        historyId: historyId!,
        questions: state.questions,
        spendTime: state.spendTime,
      );
    } else {
      return quizzesHistoryRepository.saveQuizHistory(
        questions: state.questions,
        spendTime: state.spendTime,
      );
    }
  }
}

final quizViewModelProvider =
    StateNotifierProvider.autoDispose.family<QuizViewModel, QuizState, int?>(
  (ref, historyId) {
    final questionNumber = ref.watch(userSettingsProvider
        .select((value) => value.userSettings.preferredQuestionQty));
    final quizRepository = ref.read(quizRepositoryProvider);
    final quizzesHistoryRepository = ref.read(quizzesHistoryRepositoryProvider(
        FirebaseAuth.instance.currentUser?.uid));
    return QuizViewModel(
      historyId: historyId,
      quizRepository: quizRepository,
      questionQty: questionNumber,
      quizzesHistoryRepository: quizzesHistoryRepository,
    );
  },
);
