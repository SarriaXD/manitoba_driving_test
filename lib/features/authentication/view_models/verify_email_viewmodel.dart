import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/verify_email_state.dart';

class VerifyEmailViewModel extends StateNotifier<VerifyEmailState> {
  VerifyEmailViewModel() : super(VerifyEmailState());
  Timer? _timer;

  void sendEmail() {
    final auth = FirebaseAuth.instance;
    auth.currentUser?.sendEmailVerification();
    _startCheckingEmailVerification();
    state = state.copyWith(isVerifycationStarted: true);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startCheckingEmailVerification() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      await FirebaseAuth.instance.currentUser!.reload();
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        if (user.emailVerified) {
          state = state.copyWith(isEmailVerified: user.emailVerified);
          timer.cancel();
        }
      }
    });
  }
}

final verifyEmailViewModelProvider =
    StateNotifierProvider.autoDispose<VerifyEmailViewModel, VerifyEmailState>(
  (ref) => VerifyEmailViewModel(),
);
