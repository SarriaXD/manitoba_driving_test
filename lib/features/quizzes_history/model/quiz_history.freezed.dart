// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QuizHistory {
  int get id => throw _privateConstructorUsedError;
  DateTime get createTime => throw _privateConstructorUsedError;
  DateTime get updateTime => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  int get correctSize => throw _privateConstructorUsedError;
  int get totalSize => throw _privateConstructorUsedError;
  int get submittedSize => throw _privateConstructorUsedError;
  bool get isFinished => throw _privateConstructorUsedError;
  int get spentTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuizHistoryCopyWith<QuizHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizHistoryCopyWith<$Res> {
  factory $QuizHistoryCopyWith(
          QuizHistory value, $Res Function(QuizHistory) then) =
      _$QuizHistoryCopyWithImpl<$Res, QuizHistory>;
  @useResult
  $Res call(
      {int id,
      DateTime createTime,
      DateTime updateTime,
      String language,
      int correctSize,
      int totalSize,
      int submittedSize,
      bool isFinished,
      int spentTime});
}

/// @nodoc
class _$QuizHistoryCopyWithImpl<$Res, $Val extends QuizHistory>
    implements $QuizHistoryCopyWith<$Res> {
  _$QuizHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createTime = null,
    Object? updateTime = null,
    Object? language = null,
    Object? correctSize = null,
    Object? totalSize = null,
    Object? submittedSize = null,
    Object? isFinished = null,
    Object? spentTime = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createTime: null == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updateTime: null == updateTime
          ? _value.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      correctSize: null == correctSize
          ? _value.correctSize
          : correctSize // ignore: cast_nullable_to_non_nullable
              as int,
      totalSize: null == totalSize
          ? _value.totalSize
          : totalSize // ignore: cast_nullable_to_non_nullable
              as int,
      submittedSize: null == submittedSize
          ? _value.submittedSize
          : submittedSize // ignore: cast_nullable_to_non_nullable
              as int,
      isFinished: null == isFinished
          ? _value.isFinished
          : isFinished // ignore: cast_nullable_to_non_nullable
              as bool,
      spentTime: null == spentTime
          ? _value.spentTime
          : spentTime // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QuizHistoryImplCopyWith<$Res>
    implements $QuizHistoryCopyWith<$Res> {
  factory _$$QuizHistoryImplCopyWith(
          _$QuizHistoryImpl value, $Res Function(_$QuizHistoryImpl) then) =
      __$$QuizHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      DateTime createTime,
      DateTime updateTime,
      String language,
      int correctSize,
      int totalSize,
      int submittedSize,
      bool isFinished,
      int spentTime});
}

/// @nodoc
class __$$QuizHistoryImplCopyWithImpl<$Res>
    extends _$QuizHistoryCopyWithImpl<$Res, _$QuizHistoryImpl>
    implements _$$QuizHistoryImplCopyWith<$Res> {
  __$$QuizHistoryImplCopyWithImpl(
      _$QuizHistoryImpl _value, $Res Function(_$QuizHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createTime = null,
    Object? updateTime = null,
    Object? language = null,
    Object? correctSize = null,
    Object? totalSize = null,
    Object? submittedSize = null,
    Object? isFinished = null,
    Object? spentTime = null,
  }) {
    return _then(_$QuizHistoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createTime: null == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updateTime: null == updateTime
          ? _value.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      correctSize: null == correctSize
          ? _value.correctSize
          : correctSize // ignore: cast_nullable_to_non_nullable
              as int,
      totalSize: null == totalSize
          ? _value.totalSize
          : totalSize // ignore: cast_nullable_to_non_nullable
              as int,
      submittedSize: null == submittedSize
          ? _value.submittedSize
          : submittedSize // ignore: cast_nullable_to_non_nullable
              as int,
      isFinished: null == isFinished
          ? _value.isFinished
          : isFinished // ignore: cast_nullable_to_non_nullable
              as bool,
      spentTime: null == spentTime
          ? _value.spentTime
          : spentTime // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$QuizHistoryImpl implements _QuizHistory {
  _$QuizHistoryImpl(
      {required this.id,
      required this.createTime,
      required this.updateTime,
      required this.language,
      required this.correctSize,
      required this.totalSize,
      required this.submittedSize,
      required this.isFinished,
      required this.spentTime});

  @override
  final int id;
  @override
  final DateTime createTime;
  @override
  final DateTime updateTime;
  @override
  final String language;
  @override
  final int correctSize;
  @override
  final int totalSize;
  @override
  final int submittedSize;
  @override
  final bool isFinished;
  @override
  final int spentTime;

  @override
  String toString() {
    return 'QuizHistory(id: $id, createTime: $createTime, updateTime: $updateTime, language: $language, correctSize: $correctSize, totalSize: $totalSize, submittedSize: $submittedSize, isFinished: $isFinished, spentTime: $spentTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuizHistoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createTime, createTime) ||
                other.createTime == createTime) &&
            (identical(other.updateTime, updateTime) ||
                other.updateTime == updateTime) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.correctSize, correctSize) ||
                other.correctSize == correctSize) &&
            (identical(other.totalSize, totalSize) ||
                other.totalSize == totalSize) &&
            (identical(other.submittedSize, submittedSize) ||
                other.submittedSize == submittedSize) &&
            (identical(other.isFinished, isFinished) ||
                other.isFinished == isFinished) &&
            (identical(other.spentTime, spentTime) ||
                other.spentTime == spentTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, createTime, updateTime,
      language, correctSize, totalSize, submittedSize, isFinished, spentTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuizHistoryImplCopyWith<_$QuizHistoryImpl> get copyWith =>
      __$$QuizHistoryImplCopyWithImpl<_$QuizHistoryImpl>(this, _$identity);
}

abstract class _QuizHistory implements QuizHistory {
  factory _QuizHistory(
      {required final int id,
      required final DateTime createTime,
      required final DateTime updateTime,
      required final String language,
      required final int correctSize,
      required final int totalSize,
      required final int submittedSize,
      required final bool isFinished,
      required final int spentTime}) = _$QuizHistoryImpl;

  @override
  int get id;
  @override
  DateTime get createTime;
  @override
  DateTime get updateTime;
  @override
  String get language;
  @override
  int get correctSize;
  @override
  int get totalSize;
  @override
  int get submittedSize;
  @override
  bool get isFinished;
  @override
  int get spentTime;
  @override
  @JsonKey(ignore: true)
  _$$QuizHistoryImplCopyWith<_$QuizHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
