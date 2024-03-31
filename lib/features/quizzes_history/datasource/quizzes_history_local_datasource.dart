import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:manitoba_driving_test/features/quizzes_history/entity/quizzes_history_entity.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class QuizzesHistoryLocalDataSource {
  late Future<Isar> db;
  final String uid;

  QuizzesHistoryLocalDataSource({required String? uid})
      : uid = uid ?? 'default' {
    db = _openDB(this.uid);
  }

  Future<int> addQuizzesHistory(
    QuizHistoryEntity quizHistoryEntity,
    List<QuizHistoryQuestionEntity> quizHistoryQuestionEntities,
  ) async {
    final isar = await db;
    return await isar.writeTxn(() async {
      final id = await isar.quizHistoryEntitys.put(quizHistoryEntity);
      for (var element in quizHistoryQuestionEntities) {
        element.quizHistoryId = id;
      }
      await isar.quizHistoryQuestionEntitys.putAll(quizHistoryQuestionEntities);
      return id;
    });
  }

  Future<int> updateQuizzesHistory({
    required int historyId,
    required QuizHistoryEntity quizHistoryEntity,
    required List<QuizHistoryQuestionEntity> quizHistoryQuestionEntities,
  }) async {
    final isar = await db;
    return await isar.writeTxn(() async {
      quizHistoryEntity.id = historyId;
      await isar.quizHistoryEntitys.put(quizHistoryEntity);
      for (var element in quizHistoryQuestionEntities) {
        element.quizHistoryId = historyId;
      }
      await isar.quizHistoryQuestionEntitys.putAll(quizHistoryQuestionEntities);
      return historyId;
    });
  }

  Future<QuizHistoryEntity?> getHistory(int historyId) async {
    final isar = await db;
    return isar.quizHistoryEntitys.get(historyId);
  }

  Future<List<QuizHistoryEntity>> getUnfinishedHistories() async {
    final isar = await db;
    return isar.quizHistoryEntitys
        .where()
        .isFinishedEqualTo(false)
        .sortByCreateTimeDesc()
        .findAll();
  }

  Future<List<QuizHistoryEntity>> getFinishedHistories(
      {required int offset, required int limit}) async {
    final isar = await db;
    return isar.quizHistoryEntitys
        .where()
        .isFinishedEqualTo(true)
        .sortByUpdateTimeDesc()
        .offset(offset)
        .limit(limit)
        .findAll();
  }

  Future<List<QuizHistoryQuestionEntity>> getHistoryQuestions(
    int historyId,
  ) async {
    final isar = await db;
    return isar.quizHistoryQuestionEntitys
        .where()
        .quizHistoryIdEqualTo(historyId)
        .findAll();
  }

  Future<int> getFinishedHistoriesCount() async {
    final isar = await db;
    return isar.quizHistoryEntitys.where().isFinishedEqualTo(true).count();
  }

  Future<int> getUnfinishedHistoriesCount() async {
    final isar = await db;
    return isar.quizHistoryEntitys.where().isFinishedEqualTo(false).count();
  }

  Future<int> clearHistories() async {
    final isar = await db;
    final ids = await isar.quizHistoryEntitys
        .where()
        .findAll()
        .then((value) => value.map((e) => e.id).toList());
    final questionIds = await isar.quizHistoryQuestionEntitys
        .where()
        .findAll()
        .then((value) => value.map((e) => e.id).toList());
    return isar.writeTxn(() async {
      await isar.quizHistoryEntitys.deleteAll(ids);
      await isar.quizHistoryQuestionEntitys.deleteAll(questionIds);
      return ids.length;
    });
  }

  Future<bool> removeHistory(int historyId) async {
    final isar = await db;
    return isar.writeTxn(() async {
      final questionIds = await isar.quizHistoryQuestionEntitys
          .where()
          .quizHistoryIdEqualTo(historyId)
          .findAll()
          .then((value) => value.map((e) => e.id).toList());
      final isDeleteHistorySuccess =
          await isar.quizHistoryEntitys.delete(historyId);
      final deleteQuestionLength =
          await isar.quizHistoryQuestionEntitys.deleteAll(questionIds);
      return isDeleteHistorySuccess &&
          deleteQuestionLength == questionIds.length;
    });
  }

  Future<Isar> _openDB(String uid) async {
    final dir = await getApplicationSupportDirectory();
    final userDir = Directory(p.join(dir.path, uid));
    final isUserDirExists = await userDir.exists();
    if (!isUserDirExists) {
      await userDir.create();
    }
    final currentIsar = Isar.getInstance();
    await currentIsar?.close();
    final newIsar = await Isar.open(
      [QuizHistoryEntitySchema, QuizHistoryQuestionEntitySchema],
      directory: userDir.path,
      inspector: true,
    );
    return newIsar;
  }
}

final quizzesHistoryLocalDataSourceProvider =
    Provider.family<QuizzesHistoryLocalDataSource, String?>(
  (ref, uid) {
    return QuizzesHistoryLocalDataSource(uid: uid);
  },
);
