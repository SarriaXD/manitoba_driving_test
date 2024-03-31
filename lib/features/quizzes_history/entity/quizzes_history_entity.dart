import 'package:isar/isar.dart';

part 'quizzes_history_entity.g.dart';

@Collection()
class QuizHistoryEntity {
  Id id = Isar.autoIncrement;
  @Index()
  DateTime? createTime;
  @Index()
  DateTime? updateTime;
  String? language;
  int? correctSize;
  int? totalSize;
  int? spentTime;
  int? submittedSize;
  @Index()
  bool? isFinished;
}

@Collection()
class QuizHistoryQuestionEntity {
  Id id = Isar.autoIncrement;
  @Index()
  int? quizHistoryId;
  String? question;
  String? imageUrl;
  String? correctAnswerId;
  String? selectedAnswerId;
  bool? isSubmitted;
  List<QuizHistoryAnswerEntity>? answers;
}

@embedded
class QuizHistoryAnswerEntity {
  String? id;
  String? answer;
  String? message;
}
