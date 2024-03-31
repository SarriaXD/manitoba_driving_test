import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manitoba_driving_test/features/quiz/dto/question_validation_result_dto.dart';
import 'package:manitoba_driving_test/shared/const/remote_url_const.dart';
import 'package:path/path.dart' as path;

import '../dto/question_dto.dart';

class QuizRemoteDatasource {
  final dio = Dio();
  final baseUrl = RemoteUrlConst.mpiBase;

  Future<List<QuestionDTO>> getQuestions(int questionQty) async {
    final response = await dio.post(
      path.join(baseUrl, 'DriverQuiz/api/DrivingQuizzes.svc/StartQuiz'),
      data: {"classId": "1", "classCategory": 0, "questionQty": "$questionQty"},
      options: Options(
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Referer': 'https://apps.mpi.mb.ca/DriverQuiz/?lang=en'
        },
      ),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to load quizzes');
    }
    final List<QuestionDTO> questions = (response.data as List<dynamic>)
        .map((e) => QuestionDTO.fromJson(e))
        .toList();
    return questions;
  }

  Future<QuestionValidationResultDTO> validateAnswer(String id) async {
    final response = await dio.post(
      path.join(baseUrl, 'DriverQuiz/api/DrivingQuizzes.svc/ValidateAnswer'),
      data: {"answerId": id},
      options: Options(
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Referer': 'https://apps.mpi.mb.ca/DriverQuiz/?lang=en'
        },
      ),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to validate answer');
    }
    return QuestionValidationResultDTO.fromJson(response.data);
  }
}

final quizzesRemoteDatasourceProvider = Provider<QuizRemoteDatasource>((ref) {
  return QuizRemoteDatasource();
});
