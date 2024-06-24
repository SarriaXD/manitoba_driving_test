import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../shared/utils/time_formatter.dart';
import '../../viewmodel/quiz_viewmodel.dart';

class QuizTimeTick extends HookConsumerWidget {
  const QuizTimeTick({super.key, required this.historyId});

  final int? historyId;

  void _startTimer(
    ObjectRef<Timer?> timer,
    ValueNotifier<int> seconds,
    WidgetRef ref,
  ) {
    timer.value = Timer.periodic(const Duration(seconds: 1), (timer) {
      seconds.value++;
      ref
          .read(quizViewModelProvider(historyId).notifier)
          .onTimeChanged(seconds.value);
    });
  }

  void _pauseTimer(ObjectRef<Timer?> timer) {
    timer.value?.cancel();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seconds = useState(ref.read(
        quizViewModelProvider(historyId).select((value) => value.spendTime)));
    final totalSeconds = 30.minutes.inSeconds;
    final remain = (totalSeconds - seconds.value).clamp(0, totalSeconds);
    final color = remain == 0
        ? Theme.of(context).colorScheme.error
        : Theme.of(context).colorScheme.onBackground.withOpacity(.6);
    final timer = useRef<Timer?>(null);
    // start timer when init and pause when dispose
    useEffect(() {
      _startTimer(timer, seconds, ref);
      return () => _pauseTimer(timer);
    }, []);
    // pause timer when app is paused and start when resumed
    useOnAppLifecycleStateChange((_, current) {
      if (current == AppLifecycleState.resumed) {
        _startTimer(timer, seconds, ref);
      } else if (current == AppLifecycleState.paused) {
        _pauseTimer(timer);
      }
    });
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
