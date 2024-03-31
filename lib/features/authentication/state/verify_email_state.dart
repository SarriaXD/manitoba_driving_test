import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_email_state.freezed.dart';

@freezed
class VerifyEmailState with _$VerifyEmailState {
  factory VerifyEmailState({
    @Default(false) bool isVerifycationStarted,
    @Default(false) bool isEmailVerified,
  }) = _VerifyEmailState;
}
