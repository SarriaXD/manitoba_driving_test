// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

QuestionValidationResultDTO questionValidationResultFromJson(String str) => QuestionValidationResultDTO.fromJson(json.decode(str));

String questionValidationToJson(QuestionValidationResultDTO data) => json.encode(data.toJson());

class QuestionValidationResultDTO {
    String answerId;
    bool correct;
    String message;

    QuestionValidationResultDTO({
        required this.answerId,
        required this.correct,
        required this.message,
    });

    factory QuestionValidationResultDTO.fromJson(Map<String, dynamic> json) => QuestionValidationResultDTO(
        answerId: json["answerId"],
        correct: json["correct"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "answerId": answerId,
        "correct": correct,
        "message": message,
    };
}
