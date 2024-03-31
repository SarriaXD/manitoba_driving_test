// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Question {
  int get id => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  List<Answer> get answers => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String get correctAnswerId => throw _privateConstructorUsedError;
  String? get selectedAnswerId => throw _privateConstructorUsedError;
  bool get isSubmitted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res, Question>;
  @useResult
  $Res call(
      {int id,
      String question,
      String language,
      List<Answer> answers,
      String? imageUrl,
      String correctAnswerId,
      String? selectedAnswerId,
      bool isSubmitted});
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res, $Val extends Question>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? language = null,
    Object? answers = null,
    Object? imageUrl = freezed,
    Object? correctAnswerId = null,
    Object? selectedAnswerId = freezed,
    Object? isSubmitted = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      correctAnswerId: null == correctAnswerId
          ? _value.correctAnswerId
          : correctAnswerId // ignore: cast_nullable_to_non_nullable
              as String,
      selectedAnswerId: freezed == selectedAnswerId
          ? _value.selectedAnswerId
          : selectedAnswerId // ignore: cast_nullable_to_non_nullable
              as String?,
      isSubmitted: null == isSubmitted
          ? _value.isSubmitted
          : isSubmitted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuestionImplCopyWith<$Res>
    implements $QuestionCopyWith<$Res> {
  factory _$$QuestionImplCopyWith(
          _$QuestionImpl value, $Res Function(_$QuestionImpl) then) =
      __$$QuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String question,
      String language,
      List<Answer> answers,
      String? imageUrl,
      String correctAnswerId,
      String? selectedAnswerId,
      bool isSubmitted});
}

/// @nodoc
class __$$QuestionImplCopyWithImpl<$Res>
    extends _$QuestionCopyWithImpl<$Res, _$QuestionImpl>
    implements _$$QuestionImplCopyWith<$Res> {
  __$$QuestionImplCopyWithImpl(
      _$QuestionImpl _value, $Res Function(_$QuestionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? language = null,
    Object? answers = null,
    Object? imageUrl = freezed,
    Object? correctAnswerId = null,
    Object? selectedAnswerId = freezed,
    Object? isSubmitted = null,
  }) {
    return _then(_$QuestionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      correctAnswerId: null == correctAnswerId
          ? _value.correctAnswerId
          : correctAnswerId // ignore: cast_nullable_to_non_nullable
              as String,
      selectedAnswerId: freezed == selectedAnswerId
          ? _value.selectedAnswerId
          : selectedAnswerId // ignore: cast_nullable_to_non_nullable
              as String?,
      isSubmitted: null == isSubmitted
          ? _value.isSubmitted
          : isSubmitted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$QuestionImpl implements _Question {
  _$QuestionImpl(
      {required this.id,
      required this.question,
      required this.language,
      required final List<Answer> answers,
      this.imageUrl,
      required this.correctAnswerId,
      this.selectedAnswerId,
      this.isSubmitted = false})
      : _answers = answers;

  @override
  final int id;
  @override
  final String question;
  @override
  final String language;
  final List<Answer> _answers;
  @override
  List<Answer> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  final String? imageUrl;
  @override
  final String correctAnswerId;
  @override
  final String? selectedAnswerId;
  @override
  @JsonKey()
  final bool isSubmitted;

  @override
  String toString() {
    return 'Question(id: $id, question: $question, language: $language, answers: $answers, imageUrl: $imageUrl, correctAnswerId: $correctAnswerId, selectedAnswerId: $selectedAnswerId, isSubmitted: $isSubmitted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.language, language) ||
                other.language == language) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.correctAnswerId, correctAnswerId) ||
                other.correctAnswerId == correctAnswerId) &&
            (identical(other.selectedAnswerId, selectedAnswerId) ||
                other.selectedAnswerId == selectedAnswerId) &&
            (identical(other.isSubmitted, isSubmitted) ||
                other.isSubmitted == isSubmitted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      question,
      language,
      const DeepCollectionEquality().hash(_answers),
      imageUrl,
      correctAnswerId,
      selectedAnswerId,
      isSubmitted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      __$$QuestionImplCopyWithImpl<_$QuestionImpl>(this, _$identity);
}

abstract class _Question implements Question {
  factory _Question(
      {required final int id,
      required final String question,
      required final String language,
      required final List<Answer> answers,
      final String? imageUrl,
      required final String correctAnswerId,
      final String? selectedAnswerId,
      final bool isSubmitted}) = _$QuestionImpl;

  @override
  int get id;
  @override
  String get question;
  @override
  String get language;
  @override
  List<Answer> get answers;
  @override
  String? get imageUrl;
  @override
  String get correctAnswerId;
  @override
  String? get selectedAnswerId;
  @override
  bool get isSubmitted;
  @override
  @JsonKey(ignore: true)
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Answer {
  String get id => throw _privateConstructorUsedError;
  int get questionId => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnswerCopyWith<Answer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerCopyWith<$Res> {
  factory $AnswerCopyWith(Answer value, $Res Function(Answer) then) =
      _$AnswerCopyWithImpl<$Res, Answer>;
  @useResult
  $Res call({String id, int questionId, String answer, String message});
}

/// @nodoc
class _$AnswerCopyWithImpl<$Res, $Val extends Answer>
    implements $AnswerCopyWith<$Res> {
  _$AnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? questionId = null,
    Object? answer = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnswerImplCopyWith<$Res> implements $AnswerCopyWith<$Res> {
  factory _$$AnswerImplCopyWith(
          _$AnswerImpl value, $Res Function(_$AnswerImpl) then) =
      __$$AnswerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, int questionId, String answer, String message});
}

/// @nodoc
class __$$AnswerImplCopyWithImpl<$Res>
    extends _$AnswerCopyWithImpl<$Res, _$AnswerImpl>
    implements _$$AnswerImplCopyWith<$Res> {
  __$$AnswerImplCopyWithImpl(
      _$AnswerImpl _value, $Res Function(_$AnswerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? questionId = null,
    Object? answer = null,
    Object? message = null,
  }) {
    return _then(_$AnswerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      questionId: null == questionId
          ? _value.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AnswerImpl implements _Answer {
  _$AnswerImpl(
      {required this.id,
      required this.questionId,
      required this.answer,
      required this.message});

  @override
  final String id;
  @override
  final int questionId;
  @override
  final String answer;
  @override
  final String message;

  @override
  String toString() {
    return 'Answer(id: $id, questionId: $questionId, answer: $answer, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnswerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, questionId, answer, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnswerImplCopyWith<_$AnswerImpl> get copyWith =>
      __$$AnswerImplCopyWithImpl<_$AnswerImpl>(this, _$identity);
}

abstract class _Answer implements Answer {
  factory _Answer(
      {required final String id,
      required final int questionId,
      required final String answer,
      required final String message}) = _$AnswerImpl;

  @override
  String get id;
  @override
  int get questionId;
  @override
  String get answer;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$AnswerImplCopyWith<_$AnswerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
