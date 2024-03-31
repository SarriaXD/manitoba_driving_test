import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    @Default(false) bool isLoading,
    @Default('') String email,
    @Default('') String password,
    @Default(null) String? emailError,
    @Default(null) String? passwordError,
    @Default(false) bool navigateToDashboard,
    @Default(null) String? loginError,
  }) = _LoginState;
}
