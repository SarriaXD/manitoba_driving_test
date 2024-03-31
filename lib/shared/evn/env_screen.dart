import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manitoba_driving_test/shared/evn/viewmodel/env_viewmodel.dart';

import '../../features/quizzes_history/viewmodel/quiz_history_viewmodel.dart';

class EnvScreen extends ConsumerStatefulWidget {
  const EnvScreen({super.key});

  @override
  ConsumerState<EnvScreen> createState() => _EnvScreenState();
}

class _EnvScreenState extends ConsumerState<EnvScreen> {
  final finishedTextController = TextEditingController();
  final unfinishedTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state =
        ref.watch(envViewModelProvider(FirebaseAuth.instance.currentUser!.uid));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Env Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Finished: ${state.finishedCount}'),
              Text('Unfinished: ${state.unfinishedCount}'),
              TextField(
                controller: finishedTextController,
                decoration: const InputDecoration(
                  hintText: 'Finished Quantity',
                ),
              ),
              TextField(
                controller: unfinishedTextController,
                decoration: const InputDecoration(
                  hintText: 'Unfinished Quantity',
                ),
              ),
              ElevatedButton(
                onPressed: state.isLoading ? null : _generateHistories,
                child: state.isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Generate Histories'),
              ),
              ElevatedButton(
                onPressed: state.isLoading ? null : _clearQuestions,
                child: state.isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Clear all Histories'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _generateHistories() async {
    await ref
        .read(envViewModelProvider(FirebaseAuth.instance.currentUser!.uid)
            .notifier)
        .generateHistories(
          finishedQuantity: finishedTextController.text.isNotEmpty
              ? int.parse(finishedTextController.text)
              : 0,
          unFinishedQuantity: unfinishedTextController.text.isNotEmpty
              ? int.parse(unfinishedTextController.text)
              : 0,
        );
    await _reloadHistories();
  }

  void _clearQuestions() async {
    await ref
        .read(envViewModelProvider(FirebaseAuth.instance.currentUser!.uid)
            .notifier)
        .clearHistories();
    await _reloadHistories();
  }

  Future<void> _reloadHistories() async {
    await ref
        .read(
            quizHistoryViewModelProvider(FirebaseAuth.instance.currentUser?.uid)
                .notifier)
        .reloadHistories();
  }
}
