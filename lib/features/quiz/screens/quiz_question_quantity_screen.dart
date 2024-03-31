import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:manitoba_driving_test/shared/widgets/dark_mode_switch_button.dart';

import '../widgets/quiz_question_quantity/quiz_question_quantity_slider.dart';

class QuizQuestionQuantityScreen extends ConsumerWidget {
  const QuizQuestionQuantityScreen({
    super.key,
    required this.onNext,
  });
  final Function() onNext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(),
        actions: const [DarkModeSwitchButton()],
      ),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 32),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'Please select the number of questions',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                        textAlign: TextAlign.center,
                      ),
                      LottieBuilder.asset(
                        'assets/animations/lottie_question_quantity.json',
                      ),
                      const SizedBox(height: 32),
                      QuizQuestionQuantitySlider(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style:
                      FilledButton.styleFrom(padding: const EdgeInsets.all(12)),
                  onPressed: onNext,
                  child: const Text('Start Quiz'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
