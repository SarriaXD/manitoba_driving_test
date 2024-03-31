import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/login_state.dart';

class LoginViewModel extends StateNotifier<LoginState> {
  LoginViewModel() : super(LoginState());

  void onUserInputChanged({
    String? email,
    String? password,
  }) {
    state = state.copyWith(
      email: email ?? state.email,
      password: password ?? state.password,
      emailError: email != null ? null : state.emailError,
      passwordError: password != null ? null : state.passwordError,
    );
  }

  void signInWithEmailAndPassword() async {
    if (_validate()) {
      try {
        state = state.copyWith(isLoading: true);
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: state.email,
          password: state.password,
        );
        state = state.copyWith(navigateToDashboard: true, isLoading: false);
      } on FirebaseAuthException catch (e) {
        String errorMessage = getErrorMessage(e);
        state = state.copyWith(
          loginError: errorMessage,
        );
      } catch (e) {
        state = state.copyWith(
          isLoading: false,
          loginError: e.toString(),
        );
      } finally {
        state = state.copyWith(isLoading: false);
      }
    }
  }

  String getErrorMessage(FirebaseAuthException e) {
    if (e.code == 'user-not-found') {
      return 'No user found for that email.';
    } else if (e.code == 'wrong-password') {
      return 'Wrong password provided for that user.';
    } else if (e.code == 'invalid-credential') {
      return 'Invalid username or password.';
    } else {
      return e.message ?? 'Can not login with your email or password for now. ';
    }
  }

  bool _validate() {
    // Validate email
    final emailError = _validateEmail(state.email);
    // Validate password
    final passwordError = _validatePassword(state.password);
    if (emailError != null || passwordError != null) {
      state = state.copyWith(
        emailError: emailError,
        passwordError: passwordError,
      );
      return false;
    }
    return true;
  }

  String? _validateEmail(String email) {
    if (email.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(email)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String password) {
    if (password.isEmpty) {
      return 'Password is required';
    }
    // return password is too weak
    if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,}$').hasMatch(password)) {
      return 'Password must contain at least 6 characters, including UPPER/lowercase and numbers';
    }
    return null;
  }

  void consumeEvent(
      {bool navigateToDashboardConsumed = false,
      bool loginErrorConsumed = false}) {
    state = state.copyWith(
      navigateToDashboard:
          navigateToDashboardConsumed ? false : state.navigateToDashboard,
      loginError: loginErrorConsumed ? null : state.loginError,
    );
  }
}

final loginViewModelProvider =
    StateNotifierProvider.autoDispose<LoginViewModel, LoginState>(
  (ref) => LoginViewModel(),
);
