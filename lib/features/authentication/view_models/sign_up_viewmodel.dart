import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/logger/logger.dart';
import '../../../shared/utils/user_input_validator.dart';
import '../state/sign_up_state.dart';

class SignUpViewModel extends StateNotifier<SignUpState> {
  SignUpViewModel() : super(SignUpState());

  void onUserInputChanged({
    String? email,
    String? firstName,
    String? lastName,
    String? password,
    String? confirmPassword,
  }) {
    state = state.copyWith(
      email: email ?? state.email,
      firstName: firstName ?? state.firstName,
      lastName: lastName ?? state.lastName,
      password: password ?? state.password,
      confirmPassword: confirmPassword ?? state.confirmPassword,
      emailError: email != null ? null : state.emailError,
      firstNameError: firstName != null ? null : state.firstNameError,
      lastNameError: lastName != null ? null : state.lastNameError,
      passwordError: password != null ? null : state.passwordError,
      confirmPasswordError:
          confirmPassword != null ? null : state.confirmPasswordError,
    );
  }

  void onConditionsAcceptedChanged(bool isConditionsAccepted) {
    state = state.copyWith(
      isConditionsAccepted: isConditionsAccepted,
    );
  }

  bool _validate() {
    // Validate email
    final emailError = UserInputValidator.validateEmail(state.email);
    // Validate password
    final passwordError = UserInputValidator.validatePassword(state.password);
    // Validate confirm password
    final confirmPasswordError = UserInputValidator.validateConfirmPassword(
      state.password,
      state.confirmPassword,
    );
    // Validate first name
    final firstNameError =
        UserInputValidator.validateFirstName(state.firstName);
    // Validate last name
    final lastNameError = UserInputValidator.validateLastName(state.lastName);
    if (emailError != null ||
        passwordError != null ||
        confirmPasswordError != null ||
        firstNameError != null ||
        lastNameError != null) {
      state = state.copyWith(
        emailError: emailError,
        passwordError: passwordError,
        confirmPasswordError: confirmPasswordError,
        firstNameError: firstNameError,
        lastNameError: lastNameError,
      );
      return false;
    }
    return true;
  }

  void signUpWithEmailAndPassword() async {
    if (_validate()) {
      try {
        state = state.copyWith(isLoading: true);
        final auth = FirebaseAuth.instance;
        await auth.createUserWithEmailAndPassword(
          email: state.email,
          password: state.password,
        );

        await auth.currentUser?.updateDisplayName(
          '${state.firstName} ${state.lastName}',
        );
        state = state.copyWith(navigateToVerifyEmail: true);
      } on FirebaseAuthException catch (e) {
        logger.e(e);
        switch (e.code) {
          case 'email-already-in-use':
            state = state.copyWith(
              emailError: 'The account already exists for that email.',
            );
            break;
          case 'weak-password':
            state = state.copyWith(
              passwordError: 'The password provided is too weak.',
            );
            break;
          default:
            state = state.copyWith(
              signUpError: 'An error occurred while signing up.',
            );
            break;
        }
      } finally {
        state = state.copyWith(isLoading: false);
      }
    }
  }

  void consumeEvent({
    signUpErrorConsumed = false,
    navigateToVeryEmailConsumed = false,
  }) {
    state = state.copyWith(
      signUpError: signUpErrorConsumed ? null : state.signUpError,
      navigateToVerifyEmail:
          navigateToVeryEmailConsumed ? false : state.navigateToVerifyEmail,
    );
  }
}

final signUpViewModelProvider =
    StateNotifierProvider.autoDispose<SignUpViewModel, SignUpState>((ref) {
  return SignUpViewModel();
});
