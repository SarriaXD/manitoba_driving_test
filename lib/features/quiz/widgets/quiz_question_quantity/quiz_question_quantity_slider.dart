import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/settings/provider/user_settings_provider.dart';

class QuizQuestionQuantitySlider extends ConsumerWidget {
  QuizQuestionQuantitySlider({super.key});
  final List<double> questionQuantityList = [1, 5, 10, 15, 20];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionQuantity = ref.watch(userSettingsProvider
        .select((value) => value.userSettings.preferredQuestionQty));

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quantity',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(.8),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 8),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Theme.of(context).colorScheme.primary,
              inactiveTrackColor:
                  Theme.of(context).colorScheme.onBackground.withOpacity(.3),
              thumbColor: Theme.of(context).colorScheme.primary,
              overlayColor:
                  Theme.of(context).colorScheme.primary.withOpacity(.3),
              activeTickMarkColor: Theme.of(context).colorScheme.primary,
              inactiveTickMarkColor:
                  Theme.of(context).colorScheme.onBackground.withOpacity(.3),
              overlayShape: SliderComponentShape.noOverlay,
              thumbShape: const _CustomSliderThumbShape(),
              trackShape: const _CustomSliderTrackShape(),
            ),
            child: Slider(
              value: questionQuantity.toDouble(),
              onChanged: (value) {
                ref
                    .read(userSettingsProvider.notifier)
                    .updateSettings(preferredQuestionNumber: value.toInt());
              },
              min: questionQuantityList.first,
              max: questionQuantityList.last,
              divisions: questionQuantityList.length - 1,
              label: questionQuantity.toString(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: questionQuantityList
                .map(
                  (e) => Text(
                    e.toInt().toString(),
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: e > questionQuantity
                              ? Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(.3)
                              : Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(.8),
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}

class _CustomSliderTrackShape extends RoundedRectSliderTrackShape {
  const _CustomSliderTrackShape();
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}

class _CustomSliderThumbShape extends RoundSliderThumbShape {
  const _CustomSliderThumbShape({super.enabledThumbRadius = 10.0});

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    super.paint(context,
        center.translate(-(value - 0.5) / 0.5 * enabledThumbRadius, 0.0),
        activationAnimation: activationAnimation,
        enableAnimation: enableAnimation,
        isDiscrete: isDiscrete,
        labelPainter: labelPainter,
        parentBox: parentBox,
        sliderTheme: sliderTheme,
        textDirection: textDirection,
        value: value,
        textScaleFactor: textScaleFactor,
        sizeWithOverflow: sizeWithOverflow);
  }
}

// class _CustomSliderOverlayShape extends RoundSliderOverlayShape {
//   final double thumbRadius;
//   const _CustomSliderOverlayShape({this.thumbRadius = 10.0});

//   @override
//   void paint(
//     PaintingContext context,
//     Offset center, {
//     required Animation<double> activationAnimation,
//     required Animation<double> enableAnimation,
//     required bool isDiscrete,
//     required TextPainter labelPainter,
//     required RenderBox parentBox,
//     required SliderThemeData sliderTheme,
//     required TextDirection textDirection,
//     required double value,
//     required double textScaleFactor,
//     required Size sizeWithOverflow,
//   }) {
//     super.paint(
//         context, center.translate(-(value - 0.5) / 0.5 * thumbRadius, 0.0),
//         activationAnimation: activationAnimation,
//         enableAnimation: enableAnimation,
//         isDiscrete: isDiscrete,
//         labelPainter: labelPainter,
//         parentBox: parentBox,
//         sliderTheme: sliderTheme,
//         textDirection: textDirection,
//         value: value,
//         textScaleFactor: textScaleFactor,
//         sizeWithOverflow: sizeWithOverflow);
//   }
// }
