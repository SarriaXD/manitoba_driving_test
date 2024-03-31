import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  factory SignUpState(
      {@Default('') String email,
      @Default('') String password,
      @Default('') String confirmPassword,
      @Default('') String firstName,
      @Default('') String lastName,
      @Default(null) String? firstNameError,
      @Default(null) String? lastNameError,
      @Default(null) String? passwordError,
      @Default(null) String? confirmPasswordError,
      @Default(null) String? emailError,
      @Default(false) bool isConditionsAccepted,
      @Default(false) bool passwordObscureText,
      @Default(false) bool confirmPasswordObscureText,
      @Default(false) bool navigateToVerifyEmail,
      @Default(null) String? signUpError,
      @Default(false) bool isLoading}) = _SignUpState;
}
