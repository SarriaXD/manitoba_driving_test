// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginState {
  bool get isLoading => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String? get emailError => throw _privateConstructorUsedError;
  String? get passwordError => throw _privateConstructorUsedError;
  bool get navigateToDashboard => throw _privateConstructorUsedError;
  String? get loginError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call(
      {bool isLoading,
      String email,
      String password,
      String? emailError,
      String? passwordError,
      bool navigateToDashboard,
      String? loginError});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? email = null,
    Object? password = null,
    Object? emailError = freezed,
    Object? passwordError = freezed,
    Object? navigateToDashboard = null,
    Object? loginError = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      emailError: freezed == emailError
          ? _value.emailError
          : emailError // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordError: freezed == passwordError
          ? _value.passwordError
          : passwordError // ignore: cast_nullable_to_non_nullable
              as String?,
      navigateToDashboard: null == navigateToDashboard
          ? _value.navigateToDashboard
          : navigateToDashboard // ignore: cast_nullable_to_non_nullable
              as bool,
      loginError: freezed == loginError
          ? _value.loginError
          : loginError // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginStateImplCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$LoginStateImplCopyWith(
          _$LoginStateImpl value, $Res Function(_$LoginStateImpl) then) =
      __$$LoginStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String email,
      String password,
      String? emailError,
      String? passwordError,
      bool navigateToDashboard,
      String? loginError});
}

/// @nodoc
class __$$LoginStateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateImpl>
    implements _$$LoginStateImplCopyWith<$Res> {
  __$$LoginStateImplCopyWithImpl(
      _$LoginStateImpl _value, $Res Function(_$LoginStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? email = null,
    Object? password = null,
    Object? emailError = freezed,
    Object? passwordError = freezed,
    Object? navigateToDashboard = null,
    Object? loginError = freezed,
  }) {
    return _then(_$LoginStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      emailError: freezed == emailError
          ? _value.emailError
          : emailError // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordError: freezed == passwordError
          ? _value.passwordError
          : passwordError // ignore: cast_nullable_to_non_nullable
              as String?,
      navigateToDashboard: null == navigateToDashboard
          ? _value.navigateToDashboard
          : navigateToDashboard // ignore: cast_nullable_to_non_nullable
              as bool,
      loginError: freezed == loginError
          ? _value.loginError
          : loginError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoginStateImpl implements _LoginState {
  _$LoginStateImpl(
      {this.isLoading = false,
      this.email = '',
      this.password = '',
      this.emailError = null,
      this.passwordError = null,
      this.navigateToDashboard = false,
      this.loginError = null});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String? emailError;
  @override
  @JsonKey()
  final String? passwordError;
  @override
  @JsonKey()
  final bool navigateToDashboard;
  @override
  @JsonKey()
  final String? loginError;

  @override
  String toString() {
    return 'LoginState(isLoading: $isLoading, email: $email, password: $password, emailError: $emailError, passwordError: $passwordError, navigateToDashboard: $navigateToDashboard, loginError: $loginError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.emailError, emailError) ||
                other.emailError == emailError) &&
            (identical(other.passwordError, passwordError) ||
                other.passwordError == passwordError) &&
            (identical(other.navigateToDashboard, navigateToDashboard) ||
                other.navigateToDashboard == navigateToDashboard) &&
            (identical(other.loginError, loginError) ||
                other.loginError == loginError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, email, password,
      emailError, passwordError, navigateToDashboard, loginError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      __$$LoginStateImplCopyWithImpl<_$LoginStateImpl>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  factory _LoginState(
      {final bool isLoading,
      final String email,
      final String password,
      final String? emailError,
      final String? passwordError,
      final bool navigateToDashboard,
      final String? loginError}) = _$LoginStateImpl;

  @override
  bool get isLoading;
  @override
  String get email;
  @override
  String get password;
  @override
  String? get emailError;
  @override
  String? get passwordError;
  @override
  bool get navigateToDashboard;
  @override
  String? get loginError;
  @override
  @JsonKey(ignore: true)
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
