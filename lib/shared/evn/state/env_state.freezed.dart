// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'env_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EnvState {
  bool get isLoading => throw _privateConstructorUsedError;
  int get unfinishedCount => throw _privateConstructorUsedError;
  int get finishedCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EnvStateCopyWith<EnvState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnvStateCopyWith<$Res> {
  factory $EnvStateCopyWith(EnvState value, $Res Function(EnvState) then) =
      _$EnvStateCopyWithImpl<$Res, EnvState>;
  @useResult
  $Res call({bool isLoading, int unfinishedCount, int finishedCount});
}

/// @nodoc
class _$EnvStateCopyWithImpl<$Res, $Val extends EnvState>
    implements $EnvStateCopyWith<$Res> {
  _$EnvStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? unfinishedCount = null,
    Object? finishedCount = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      unfinishedCount: null == unfinishedCount
          ? _value.unfinishedCount
          : unfinishedCount // ignore: cast_nullable_to_non_nullable
              as int,
      finishedCount: null == finishedCount
          ? _value.finishedCount
          : finishedCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EnvStateImplCopyWith<$Res>
    implements $EnvStateCopyWith<$Res> {
  factory _$$EnvStateImplCopyWith(
          _$EnvStateImpl value, $Res Function(_$EnvStateImpl) then) =
      __$$EnvStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, int unfinishedCount, int finishedCount});
}

/// @nodoc
class __$$EnvStateImplCopyWithImpl<$Res>
    extends _$EnvStateCopyWithImpl<$Res, _$EnvStateImpl>
    implements _$$EnvStateImplCopyWith<$Res> {
  __$$EnvStateImplCopyWithImpl(
      _$EnvStateImpl _value, $Res Function(_$EnvStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? unfinishedCount = null,
    Object? finishedCount = null,
  }) {
    return _then(_$EnvStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      unfinishedCount: null == unfinishedCount
          ? _value.unfinishedCount
          : unfinishedCount // ignore: cast_nullable_to_non_nullable
              as int,
      finishedCount: null == finishedCount
          ? _value.finishedCount
          : finishedCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$EnvStateImpl implements _EnvState {
  _$EnvStateImpl(
      {this.isLoading = false,
      this.unfinishedCount = 0,
      this.finishedCount = 0});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final int unfinishedCount;
  @override
  @JsonKey()
  final int finishedCount;

  @override
  String toString() {
    return 'EnvState(isLoading: $isLoading, unfinishedCount: $unfinishedCount, finishedCount: $finishedCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnvStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.unfinishedCount, unfinishedCount) ||
                other.unfinishedCount == unfinishedCount) &&
            (identical(other.finishedCount, finishedCount) ||
                other.finishedCount == finishedCount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, unfinishedCount, finishedCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EnvStateImplCopyWith<_$EnvStateImpl> get copyWith =>
      __$$EnvStateImplCopyWithImpl<_$EnvStateImpl>(this, _$identity);
}

abstract class _EnvState implements EnvState {
  factory _EnvState(
      {final bool isLoading,
      final int unfinishedCount,
      final int finishedCount}) = _$EnvStateImpl;

  @override
  bool get isLoading;
  @override
  int get unfinishedCount;
  @override
  int get finishedCount;
  @override
  @JsonKey(ignore: true)
  _$$EnvStateImplCopyWith<_$EnvStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
