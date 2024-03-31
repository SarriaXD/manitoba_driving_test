import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:manitoba_driving_test/features/quizzes_history/screens/quiz_history_detail_screen.dart';

import '../../features/authentication/screens/login.dart';
import '../../features/authentication/screens/sign_up.dart';
import '../../features/authentication/screens/verify_email.dart';
import '../../features/dashboard/dashboard.dart';

final routers = GoRouter(
  initialLocation: '/',
  errorBuilder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: Center(
        child: Text('${state.error} Page not found'),
      ),
    );
  },
  redirect: (context, state) {
    final fullPath = state.fullPath;
    if (fullPath == null) {
      return null;
    }
    // full path is not in the auth section
    if (!fullPath.startsWith('/auth')) {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        return '/auth';
      }
      if (!user.emailVerified) {
        return '/auth/verify_email';
      }
    }
    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const DashboardScreen();
      },
      routes: [
        // GoRoute(
        //   path: 'quiz_question_quantity',
        //   builder: (context, state) {
        //     return const QuizQuestionQuantityScreen();
        //   },
        // ),
        // GoRoute(
        //   path: 'start_quiz',
        //   builder: (context, state) {
        //     final String? historyId = state.extra as String?;
        //     return QuizQuestionScreen(historyId: historyId);
        //   },
        // ),
        // GoRoute(
        //   path: 'quiz_result/:historyId',
        //   builder: (context, state) {
        //     final historyId = state.pathParameters['historyId']!;
        //     return QuizResultScreen(historyId: int.parse(historyId));
        //   },
        // ),
        GoRoute(
          path: 'quiz_history_detail/:historyId',
          builder: (context, state) {
            final historyId = state.pathParameters['historyId']!;
            return QuizHistoryDetailScreen(historyId: int.parse(historyId));
          },
        ),
      ],
    ),
    GoRoute(
      path: '/auth',
      builder: (context, state) {
        return const LoginScreen();
      },
      routes: [
        GoRoute(
          path: 'sign_up',
          builder: (context, state) {
            return const SignUpScreen();
          },
        ),
        GoRoute(
          path: 'verify_email',
          builder: (context, state) {
            return const VerifyEmailScreen();
          },
        ),
      ],
    ),
  ],
);
