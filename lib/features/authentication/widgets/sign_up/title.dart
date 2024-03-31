import 'package:flutter/material.dart';

class SignUpTitle extends StatelessWidget {
  const SignUpTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headlineLarge?.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
          fontWeight: FontWeight.bold,
        );
    return RichText(
      text: TextSpan(
          text: 'Set up your account ',
          style: textStyle,
          children: <InlineSpan>[
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: Icon(
                Icons.edit,
                size: textStyle?.fontSize,
              ),
            ),
          ]),
    );
  }
}
