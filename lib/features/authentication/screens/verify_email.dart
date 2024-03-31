import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/verify_email/animated_button.dart';
import '../widgets/verify_email/animated_picture.dart';
import '../widgets/verify_email/animated_text.dart';
import '../widgets/verify_email/dot_indicator.dart';

class VerifyEmailScreen extends ConsumerWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return const Scaffold(
        body: Center(
          child: Text('User not found'),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  VerifyEmailAnimatedPicture(),
                  VerifyEmailAnimatedText(),
                ],
              ),
            ),
          ),
          VerifyEmailDotIndicator(),
          SizedBox(height: 48),
          VerifyEmailAnimatedButton(),
        ],
      ),
    );
  }
}
