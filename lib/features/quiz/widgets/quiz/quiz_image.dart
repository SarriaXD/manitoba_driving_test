import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:jovial_svg/jovial_svg.dart';

import '../../../../shared/ cache/svg_image_cache.dart';

class QuizImage extends StatelessWidget {
  const QuizImage({
    super.key,
    required this.imageUrl,
  });
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return imageUrl != null
        ? SizedBox(
            height: 200,
            width: double.infinity,
            child: ScalableImageWidget.fromSISource(
              key: ValueKey(imageUrl),
              si: HiveCacheImageSource(imageUrl!, warn: false),
              switcher: (context, child) => child
                  .animate()
                  .fadeIn(curve: Curves.easeOutCubic)
                  .scaleXY(curve: Curves.easeOutCubic),
            ),
          )
        : const SizedBox();
  }
}
