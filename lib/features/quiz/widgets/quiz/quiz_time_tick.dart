import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/utils/time_formatter.dart';
import '../../viewmodel/quiz_viewmodel.dart';

class QuizTimeTick extends ConsumerStatefulWidget {
  const QuizTimeTick({super.key, required this.historyId});
  final int? historyId;

  @override
  ConsumerState<QuizTimeTick> createState() => _QuizTimeTickState();
}

class _QuizTimeTickState extends ConsumerState<QuizTimeTick>
    with WidgetsBindingObserver {
  Timer? _timer;
  late int _seconds;
  final _totalTime = 30.minutes.inSeconds;

  @override
  void initState() {
    super.initState();
    _seconds = ref.read(quizViewModelProvider(widget.historyId)
        .select((value) => value.spendTime));
    _startTimer();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    _timer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _pauseTimer();
    } else if (state == AppLifecycleState.resumed) {
      _startTimer();
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (context.mounted) {
        setState(() {
          _seconds++;
          ref
              .read(quizViewModelProvider(widget.historyId).notifier)
              .onTimeChanged(_seconds);
        });
      }
    });
  }

  void _pauseTimer() {
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final remain = (_totalTime - _seconds).clamp(0, _totalTime);
    final color = remain == 0
        ? Theme.of(context).colorScheme.error
        : Theme.of(context).colorScheme.onBackground.withOpacity(.6);
    return Text(
      TimeFormatter.formatTime(remain),
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            fontFeatures: [const FontFeature.tabularFigures()],
            color: color,
          ),
    );
  }
}
