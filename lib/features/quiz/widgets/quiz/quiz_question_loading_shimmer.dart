import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class QuizQuestionLoadingShimmer extends StatelessWidget {
  const QuizQuestionLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.onBackground.withOpacity(.1),
      highlightColor:
          Theme.of(context).colorScheme.onBackground.withOpacity(.2),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ShimmerPlaceholder(height: 16, width: 100),
            SizedBox(height: 16),
            _ShimmerPlaceholder(height: 24, width: double.infinity),
            SizedBox(height: 8),
            _ShimmerPlaceholder(height: 24, width: double.infinity),
            SizedBox(height: 8),
            _ShimmerPlaceholder(height: 24, width: double.infinity),
            SizedBox(height: 32),
            _ShimmerPlaceholder(height: 80, width: double.infinity),
            SizedBox(height: 32),
            _ShimmerPlaceholder(height: 80, width: double.infinity),
            SizedBox(height: 32),
            _ShimmerPlaceholder(height: 80, width: double.infinity),
            SizedBox(height: 32),
            _ShimmerPlaceholder(height: 80, width: double.infinity),
          ],
        ),
      ),
    );
  }
}

class _ShimmerPlaceholder extends StatelessWidget {
  const _ShimmerPlaceholder({required this.height, required this.width});
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
