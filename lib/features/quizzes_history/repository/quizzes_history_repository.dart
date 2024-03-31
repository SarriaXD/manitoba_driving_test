import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manitoba_driving_test/features/quizzes_history/datasource/quizzes_history_local_datasource.dart';
import 'package:manitoba_driving_test/features/quizzes_history/entity/quizzes_history_entity.dart';

import '../../quiz/models/question.dart';
import '../model/quiz_history.dart';

class QuizzesHistoryRepository {
  final QuizzesHistoryLocalDataSource quizzesHistoryDataSource;

  QuizzesHistoryRepository(this.quizzesHistoryDataSource);

  Future<int> saveQuizHistory({
    required List<Question> questions,
    required int spendTime,
    DateTime? createTime,
  }) async {
    final quizHistory = questions.toHistory()
      ..spentTime = spendTime
      ..createTime = createTime ?? DateTime.now()
      ..updateTime = createTime ?? DateTime.now();
    final quizHistoryQuestions = questions.toHistoryQuestions(
      copyId: false,
    );
    return quizzesHistoryDataSource.addQuizzesHistory(
      quizHistory,
      quizHistoryQuestions,
    );
  }

  Future<int> updateQuizHistory({
    required int historyId,
    required List<Question> questions,
    required int spendTime,
  }) async {
    final quizHistoryEntity =
        await quizzesHistoryDataSource.getHistory(historyId);
    final quizHistory = questions.toHistory()
      ..spentTime = spendTime
      ..createTime = quizHistoryEntity?.createTime ?? DateTime.now()
      ..updateTime = DateTime.now();
    final quizHistoryQuestions = questions.toHistoryQuestions(
      copyId: true,
    );
    return quizzesHistoryDataSource.updateQuizzesHistory(
      historyId: historyId,
      quizHistoryEntity: quizHistory,
      quizHistoryQuestionEntities: quizHistoryQuestions,
    );
  }

  Future<List<QuizHistory>> getUnfinishedHistories() async {
    return await quizzesHistoryDataSource
        .getUnfinishedHistories()
        .then((value) => value.toQuizzesHistory());
  }

  Future<List<QuizHistory>> getFinishedHistories({
    required int offset,
    required int limit,
  }) async {
    return await quizzesHistoryDataSource
        .getFinishedHistories(offset: offset, limit: limit)
        .then((value) => value.toQuizzesHistory());
  }

  Future<List<Question>> getHistoryQuestions(int historyId) async {
    final history = await getHistory(historyId);
    if (history == null) {
      return [];
    }
    final questions =
        await quizzesHistoryDataSource.getHistoryQuestions(historyId);
    return questions.toQuestions();
  }

  DateTime? formatDate(DateTime? date) {
    if (date == null) {
      return null;
    }
    return DateTime(date.year, date.month, date.day);
  }

  Future<QuizHistory?> getHistory(int historyId) async {
    return quizzesHistoryDataSource
        .getHistory(historyId)
        .then((value) => value?.toQuizHistory());
  }

  Future<int> getFinishedHistoriesCount() async {
    return quizzesHistoryDataSource.getFinishedHistoriesCount();
  }

  Future<int> getUnfinishedHistoriesCount() async {
    return quizzesHistoryDataSource.getUnfinishedHistoriesCount();
  }

  Future<int> clearHistories() async {
    return quizzesHistoryDataSource.clearHistories();
  }

  Future<bool> removeHistory(int historyId) async {
    return quizzesHistoryDataSource.removeHistory(historyId);
  }
}

final quizzesHistoryRepositoryProvider =
    Provider.family<QuizzesHistoryRepository, String?>(
  (ref, uid) {
    return QuizzesHistoryRepository(
      ref.watch(quizzesHistoryLocalDataSourceProvider(uid)),
    );
  },
);

extension QuestionsExtension on List<Question> {
  QuizHistoryEntity toHistory() {
    final questionHistoryEntity = QuizHistoryEntity();
    final submittedSize = where((element) => element.isSubmitted).length;
    questionHistoryEntity
      ..language = first.language
      ..correctSize = where(
              (element) => element.correctAnswerId == element.selectedAnswerId)
          .length
      ..totalSize = length
      ..submittedSize = submittedSize
      ..isFinished = submittedSize == length;
    return questionHistoryEntity;
  }

  // if update is true, it means that the quiz is already saved in the database
  // we need copy the id
  List<QuizHistoryQuestionEntity> toHistoryQuestions({required bool copyId}) {
    return map((question) {
      final questionEntity = QuizHistoryQuestionEntity()
        ..question = question.question
        ..imageUrl = question.imageUrl
        ..correctAnswerId = question.correctAnswerId
        ..selectedAnswerId = question.selectedAnswerId
        ..isSubmitted = question.isSubmitted
        ..answers = question.answers
            .map(
              (answer) => QuizHistoryAnswerEntity()
                ..id = answer.id
                ..answer = answer.answer
                ..message = answer.message,
            )
            .toList();
      if (copyId) {
        questionEntity.id = question.id;
      }
      return questionEntity;
    }).toList();
  }
}

extension QuizHistoryEntityExtension on QuizHistoryEntity {
  QuizHistory toQuizHistory() {
    return QuizHistory(
      id: id,
      createTime: createTime ?? DateTime.now(),
      updateTime: updateTime ?? DateTime.now(),
      language: language ?? 'en',
      correctSize: correctSize ?? 0,
      totalSize: totalSize ?? 0,
      spentTime: spentTime ?? 0,
      submittedSize: submittedSize ?? 0,
      isFinished: isFinished ?? false,
    );
  }
}

extension QuizHistoryEntitiesExtension on List<QuizHistoryEntity> {
  List<QuizHistory> toQuizzesHistory() {
    return map((quizHistoryEntity) => quizHistoryEntity.toQuizHistory())
        .toList();
  }

  List<QuizHistory> toQuizHistories() {
    return map((quizHistoryEntity) => quizHistoryEntity.toQuizHistory())
        .toList();
  }
}

extension QuizHistoryQuestionEntitiesExtension
    on List<QuizHistoryQuestionEntity> {
  List<Question> toQuestions() {
    return map((question) {
      final answers = question.answers
              ?.map((answer) => Answer(
                    id: answer.id ?? '',
                    answer: answer.answer ?? '',
                    message: answer.message ?? '',
                    questionId: question.id,
                  ))
              .toList() ??
          [];
      return Question(
        id: question.id,
        question: question.question ?? '',
        imageUrl: question.imageUrl,
        answers: answers,
        correctAnswerId: question.correctAnswerId ?? '',
        selectedAnswerId: question.selectedAnswerId,
        isSubmitted: question.isSubmitted ?? false,
        language: '',
      );
    }).toList();
  }
}
