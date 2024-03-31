import 'package:freezed_annotation/freezed_annotation.dart';

part 'env_state.freezed.dart';

@freezed
class EnvState with _$EnvState {
  factory EnvState({
    @Default(false) bool isLoading,
    @Default(0) int unfinishedCount,
    @Default(0) int finishedCount,
  }) = _EnvState;
}
