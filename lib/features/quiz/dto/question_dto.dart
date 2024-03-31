// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<QuestionDTO> questionDTOFromJson(String str) => List<QuestionDTO>.from(json.decode(str).map((x) => QuestionDTO.fromJson(x)));

String questionDTOToJson(List<QuestionDTO> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuestionDTO {
    List<Translation> translations;

    QuestionDTO({
        required this.translations,
    });

    factory QuestionDTO.fromJson(Map<String, dynamic> json) => QuestionDTO(
        translations: List<Translation>.from(json["translations"].map((x) => Translation.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "translations": List<dynamic>.from(translations.map((x) => x.toJson())),
    };
}

class Translation {
    Key key;
    ValueClass value;

    Translation({
        required this.key,
        required this.value,
    });

    factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        key: keyValues.map[json["Key"]]!,
        value: ValueClass.fromJson(json["Value"]),
    );

    Map<String, dynamic> toJson() => {
        "Key": keyValues.reverse[key],
        "Value": value.toJson(),
    };
}

enum Key {
    EN,
    FR
}

final keyValues = EnumValues({
    "en": Key.EN,
    "fr": Key.FR
});

class ValueClass {
    List<Category> category;
    int classId;
    ClassTitle classTitle;
    int id;
    String imageUrl;
    Key lang;
    String questionText;
    List<AnswerDTO> answers;

    ValueClass({
        required this.category,
        required this.classId,
        required this.classTitle,
        required this.id,
        required this.imageUrl,
        required this.lang,
        required this.questionText,
        required this.answers,
    });

    factory ValueClass.fromJson(Map<String, dynamic> json) => ValueClass(
        category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
        classId: json["classId"],
        classTitle: classTitleValues.map[json["classTitle"]]!,
        id: json["id"],
        imageUrl: json["imageUrl"],
        lang: keyValues.map[json["lang"]]!,
        questionText: json["questionText"],
        answers: List<AnswerDTO>.from(json["answers"].map((x) => AnswerDTO.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
        "classId": classId,
        "classTitle": classTitleValues.reverse[classTitle],
        "id": id,
        "imageUrl": imageUrl,
        "lang": keyValues.reverse[lang],
        "questionText": questionText,
        "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
    };
}

class AnswerDTO {
    String answerMessage;
    String answerText;
    String id;
    int questionId;

    AnswerDTO({
        required this.answerMessage,
        required this.answerText,
        required this.id,
        required this.questionId,
    });

    factory AnswerDTO.fromJson(Map<String, dynamic> json) => AnswerDTO(
        answerMessage: json["answerMessage"],
        answerText: json["answerText"],
        id: json["id"],
        questionId: json["questionId"],
    );

    Map<String, dynamic> toJson() => {
        "answerMessage": answerMessage,
        "answerText": answerText,
        "id": id,
        "questionId": questionId,
    };
}

class Category {
    int key;
    ValueEnum value;

    Category({
        required this.key,
        required this.value,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        key: json["Key"],
        value: valueEnumValues.map[json["Value"]]!,
    );

    Map<String, dynamic> toJson() => {
        "Key": key,
        "Value": valueEnumValues.reverse[value],
    };
}

enum ValueEnum {
    SIGNS
}

final valueEnumValues = EnumValues({
    "Signs": ValueEnum.SIGNS
});

enum ClassTitle {
    CLASS_5_PASSENGER_VEHICLE
}

final classTitleValues = EnumValues({
    "Class 5 (Passenger vehicle)": ClassTitle.CLASS_5_PASSENGER_VEHICLE
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
