// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignUpState {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String? get firstNameError => throw _privateConstructorUsedError;
  String? get lastNameError => throw _privateConstructorUsedError;
  String? get passwordError => throw _privateConstructorUsedError;
  String? get confirmPasswordError => throw _privateConstructorUsedError;
  String? get emailError => throw _privateConstructorUsedError;
  bool get isConditionsAccepted => throw _privateConstructorUsedError;
  bool get passwordObscureText => throw _privateConstructorUsedError;
  bool get confirmPasswordObscureText => throw _privateConstructorUsedError;
  bool get navigateToVerifyEmail => throw _privateConstructorUsedError;
  String? get signUpError => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpStateCopyWith<SignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) then) =
      _$SignUpStateCopyWithImpl<$Res, SignUpState>;
  @useResult
  $Res call(
      {String email,
      String password,
      String confirmPassword,
      String firstName,
      String lastName,
      String? firstNameError,
      String? lastNameError,
      String? passwordError,
      String? confirmPasswordError,
      String? emailError,
      bool isConditionsAccepted,
      bool passwordObscureText,
      bool confirmPasswordObscureText,
      bool navigateToVerifyEmail,
      String? signUpError,
      bool isLoading});
}

/// @nodoc
class _$SignUpStateCopyWithImpl<$Res, $Val extends SignUpState>
    implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? firstNameError = freezed,
    Object? lastNameError = freezed,
    Object? passwordError = freezed,
    Object? confirmPasswordError = freezed,
    Object? emailError = freezed,
    Object? isConditionsAccepted = null,
    Object? passwordObscureText = null,
    Object? confirmPasswordObscureText = null,
    Object? navigateToVerifyEmail = null,
    Object? signUpError = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      firstNameError: freezed == firstNameError
          ? _value.firstNameError
          : firstNameError // ignore: cast_nullable_to_non_nullable
              as String?,
      lastNameError: freezed == lastNameError
          ? _value.lastNameError
          : lastNameError // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordError: freezed == passwordError
          ? _value.passwordError
          : passwordError // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPasswordError: freezed == confirmPasswordError
          ? _value.confirmPasswordError
          : confirmPasswordError // ignore: cast_nullable_to_non_nullable
              as String?,
      emailError: freezed == emailError
          ? _value.emailError
          : emailError // ignore: cast_nullable_to_non_nullable
              as String?,
      isConditionsAccepted: null == isConditionsAccepted
          ? _value.isConditionsAccepted
          : isConditionsAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      passwordObscureText: null == passwordObscureText
          ? _value.passwordObscureText
          : passwordObscureText // ignore: cast_nullable_to_non_nullable
              as bool,
      confirmPasswordObscureText: null == confirmPasswordObscureText
          ? _value.confirmPasswordObscureText
          : confirmPasswordObscureText // ignore: cast_nullable_to_non_nullable
              as bool,
      navigateToVerifyEmail: null == navigateToVerifyEmail
          ? _value.navigateToVerifyEmail
          : navigateToVerifyEmail // ignore: cast_nullable_to_non_nullable
              as bool,
      signUpError: freezed == signUpError
          ? _value.signUpError
          : signUpError // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpStateImplCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory _$$SignUpStateImplCopyWith(
          _$SignUpStateImpl value, $Res Function(_$SignUpStateImpl) then) =
      __$$SignUpStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String password,
      String confirmPassword,
      String firstName,
      String lastName,
      String? firstNameError,
      String? lastNameError,
      String? passwordError,
      String? confirmPasswordError,
      String? emailError,
      bool isConditionsAccepted,
      bool passwordObscureText,
      bool confirmPasswordObscureText,
      bool navigateToVerifyEmail,
      String? signUpError,
      bool isLoading});
}

/// @nodoc
class __$$SignUpStateImplCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$SignUpStateImpl>
    implements _$$SignUpStateImplCopyWith<$Res> {
  __$$SignUpStateImplCopyWithImpl(
      _$SignUpStateImpl _value, $Res Function(_$SignUpStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? firstNameError = freezed,
    Object? lastNameError = freezed,
    Object? passwordError = freezed,
    Object? confirmPasswordError = freezed,
    Object? emailError = freezed,
    Object? isConditionsAccepted = null,
    Object? passwordObscureText = null,
    Object? confirmPasswordObscureText = null,
    Object? navigateToVerifyEmail = null,
    Object? signUpError = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$SignUpStateImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      firstNameError: freezed == firstNameError
          ? _value.firstNameError
          : firstNameError // ignore: cast_nullable_to_non_nullable
              as String?,
      lastNameError: freezed == lastNameError
          ? _value.lastNameError
          : lastNameError // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordError: freezed == passwordError
          ? _value.passwordError
          : passwordError // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPasswordError: freezed == confirmPasswordError
          ? _value.confirmPasswordError
          : confirmPasswordError // ignore: cast_nullable_to_non_nullable
              as String?,
      emailError: freezed == emailError
          ? _value.emailError
          : emailError // ignore: cast_nullable_to_non_nullable
              as String?,
      isConditionsAccepted: null == isConditionsAccepted
          ? _value.isConditionsAccepted
          : isConditionsAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      passwordObscureText: null == passwordObscureText
          ? _value.passwordObscureText
          : passwordObscureText // ignore: cast_nullable_to_non_nullable
              as bool,
      confirmPasswordObscureText: null == confirmPasswordObscureText
          ? _value.confirmPasswordObscureText
          : confirmPasswordObscureText // ignore: cast_nullable_to_non_nullable
              as bool,
      navigateToVerifyEmail: null == navigateToVerifyEmail
          ? _value.navigateToVerifyEmail
          : navigateToVerifyEmail // ignore: cast_nullable_to_non_nullable
              as bool,
      signUpError: freezed == signUpError
          ? _value.signUpError
          : signUpError // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SignUpStateImpl implements _SignUpState {
  _$SignUpStateImpl(
      {this.email = '',
      this.password = '',
      this.confirmPassword = '',
      this.firstName = '',
      this.lastName = '',
      this.firstNameError = null,
      this.lastNameError = null,
      this.passwordError = null,
      this.confirmPasswordError = null,
      this.emailError = null,
      this.isConditionsAccepted = false,
      this.passwordObscureText = false,
      this.confirmPasswordObscureText = false,
      this.navigateToVerifyEmail = false,
      this.signUpError = null,
      this.isLoading = false});

  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String confirmPassword;
  @override
  @JsonKey()
  final String firstName;
  @override
  @JsonKey()
  final String lastName;
  @override
  @JsonKey()
  final String? firstNameError;
  @override
  @JsonKey()
  final String? lastNameError;
  @override
  @JsonKey()
  final String? passwordError;
  @override
  @JsonKey()
  final String? confirmPasswordError;
  @override
  @JsonKey()
  final String? emailError;
  @override
  @JsonKey()
  final bool isConditionsAccepted;
  @override
  @JsonKey()
  final bool passwordObscureText;
  @override
  @JsonKey()
  final bool confirmPasswordObscureText;
  @override
  @JsonKey()
  final bool navigateToVerifyEmail;
  @override
  @JsonKey()
  final String? signUpError;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'SignUpState(email: $email, password: $password, confirmPassword: $confirmPassword, firstName: $firstName, lastName: $lastName, firstNameError: $firstNameError, lastNameError: $lastNameError, passwordError: $passwordError, confirmPasswordError: $confirmPasswordError, emailError: $emailError, isConditionsAccepted: $isConditionsAccepted, passwordObscureText: $passwordObscureText, confirmPasswordObscureText: $confirmPasswordObscureText, navigateToVerifyEmail: $navigateToVerifyEmail, signUpError: $signUpError, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpStateImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.firstNameError, firstNameError) ||
                other.firstNameError == firstNameError) &&
            (identical(other.lastNameError, lastNameError) ||
                other.lastNameError == lastNameError) &&
            (identical(other.passwordError, passwordError) ||
                other.passwordError == passwordError) &&
            (identical(other.confirmPasswordError, confirmPasswordError) ||
                other.confirmPasswordError == confirmPasswordError) &&
            (identical(other.emailError, emailError) ||
                other.emailError == emailError) &&
            (identical(other.isConditionsAccepted, isConditionsAccepted) ||
                other.isConditionsAccepted == isConditionsAccepted) &&
            (identical(other.passwordObscureText, passwordObscureText) ||
                other.passwordObscureText == passwordObscureText) &&
            (identical(other.confirmPasswordObscureText,
                    confirmPasswordObscureText) ||
                other.confirmPasswordObscureText ==
                    confirmPasswordObscureText) &&
            (identical(other.navigateToVerifyEmail, navigateToVerifyEmail) ||
                other.navigateToVerifyEmail == navigateToVerifyEmail) &&
            (identical(other.signUpError, signUpError) ||
                other.signUpError == signUpError) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      email,
      password,
      confirmPassword,
      firstName,
      lastName,
      firstNameError,
      lastNameError,
      passwordError,
      confirmPasswordError,
      emailError,
      isConditionsAccepted,
      passwordObscureText,
      confirmPasswordObscureText,
      navigateToVerifyEmail,
      signUpError,
      isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpStateImplCopyWith<_$SignUpStateImpl> get copyWith =>
      __$$SignUpStateImplCopyWithImpl<_$SignUpStateImpl>(this, _$identity);
}

abstract class _SignUpState implements SignUpState {
  factory _SignUpState(
      {final String email,
      final String password,
      final String confirmPassword,
      final String firstName,
      final String lastName,
      final String? firstNameError,
      final String? lastNameError,
      final String? passwordError,
      final String? confirmPasswordError,
      final String? emailError,
      final bool isConditionsAccepted,
      final bool passwordObscureText,
      final bool confirmPasswordObscureText,
      final bool navigateToVerifyEmail,
      final String? signUpError,
      final bool isLoading}) = _$SignUpStateImpl;

  @override
  String get email;
  @override
  String get password;
  @override
  String get confirmPassword;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String? get firstNameError;
  @override
  String? get lastNameError;
  @override
  String? get passwordError;
  @override
  String? get confirmPasswordError;
  @override
  String? get emailError;
  @override
  bool get isConditionsAccepted;
  @override
  bool get passwordObscureText;
  @override
  bool get confirmPasswordObscureText;
  @override
  bool get navigateToVerifyEmail;
  @override
  String? get signUpError;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$SignUpStateImplCopyWith<_$SignUpStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
