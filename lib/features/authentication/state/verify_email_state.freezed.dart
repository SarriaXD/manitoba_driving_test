// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_email_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VerifyEmailState {
  bool get isVerifycationStarted => throw _privateConstructorUsedError;
  bool get isEmailVerified => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VerifyEmailStateCopyWith<VerifyEmailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyEmailStateCopyWith<$Res> {
  factory $VerifyEmailStateCopyWith(
          VerifyEmailState value, $Res Function(VerifyEmailState) then) =
      _$VerifyEmailStateCopyWithImpl<$Res, VerifyEmailState>;
  @useResult
  $Res call({bool isVerifycationStarted, bool isEmailVerified});
}

/// @nodoc
class _$VerifyEmailStateCopyWithImpl<$Res, $Val extends VerifyEmailState>
    implements $VerifyEmailStateCopyWith<$Res> {
  _$VerifyEmailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isVerifycationStarted = null,
    Object? isEmailVerified = null,
  }) {
    return _then(_value.copyWith(
      isVerifycationStarted: null == isVerifycationStarted
          ? _value.isVerifycationStarted
          : isVerifycationStarted // ignore: cast_nullable_to_non_nullable
              as bool,
      isEmailVerified: null == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyEmailStateImplCopyWith<$Res>
    implements $VerifyEmailStateCopyWith<$Res> {
  factory _$$VerifyEmailStateImplCopyWith(_$VerifyEmailStateImpl value,
          $Res Function(_$VerifyEmailStateImpl) then) =
      __$$VerifyEmailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isVerifycationStarted, bool isEmailVerified});
}

/// @nodoc
class __$$VerifyEmailStateImplCopyWithImpl<$Res>
    extends _$VerifyEmailStateCopyWithImpl<$Res, _$VerifyEmailStateImpl>
    implements _$$VerifyEmailStateImplCopyWith<$Res> {
  __$$VerifyEmailStateImplCopyWithImpl(_$VerifyEmailStateImpl _value,
      $Res Function(_$VerifyEmailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isVerifycationStarted = null,
    Object? isEmailVerified = null,
  }) {
    return _then(_$VerifyEmailStateImpl(
      isVerifycationStarted: null == isVerifycationStarted
          ? _value.isVerifycationStarted
          : isVerifycationStarted // ignore: cast_nullable_to_non_nullable
              as bool,
      isEmailVerified: null == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$VerifyEmailStateImpl implements _VerifyEmailState {
  _$VerifyEmailStateImpl(
      {this.isVerifycationStarted = false, this.isEmailVerified = false});

  @override
  @JsonKey()
  final bool isVerifycationStarted;
  @override
  @JsonKey()
  final bool isEmailVerified;

  @override
  String toString() {
    return 'VerifyEmailState(isVerifycationStarted: $isVerifycationStarted, isEmailVerified: $isEmailVerified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyEmailStateImpl &&
            (identical(other.isVerifycationStarted, isVerifycationStarted) ||
                other.isVerifycationStarted == isVerifycationStarted) &&
            (identical(other.isEmailVerified, isEmailVerified) ||
                other.isEmailVerified == isEmailVerified));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isVerifycationStarted, isEmailVerified);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyEmailStateImplCopyWith<_$VerifyEmailStateImpl> get copyWith =>
      __$$VerifyEmailStateImplCopyWithImpl<_$VerifyEmailStateImpl>(
          this, _$identity);
}

abstract class _VerifyEmailState implements VerifyEmailState {
  factory _VerifyEmailState(
      {final bool isVerifycationStarted,
      final bool isEmailVerified}) = _$VerifyEmailStateImpl;

  @override
  bool get isVerifycationStarted;
  @override
  bool get isEmailVerified;
  @override
  @JsonKey(ignore: true)
  _$$VerifyEmailStateImplCopyWith<_$VerifyEmailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
