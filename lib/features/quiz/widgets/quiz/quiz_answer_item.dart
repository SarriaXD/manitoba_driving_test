import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class QuizAnswerItem extends StatelessWidget {
  const QuizAnswerItem({
    super.key,
    required this.answer,
    required this.alphabet,
    required this.message,
    required this.isEnable,
    required this.answerState,
    required this.playAnimation,
    required this.onSelected,
  });
  final AnswerState answerState;
  final String alphabet;
  final String answer;
  final String? message;
  final bool isEnable;
  final bool playAnimation;
  final void Function() onSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnable ? () => onSelected() : null,
      child: AnimatedScale(
        scale: scale,
        duration: Durations.medium1,
        curve: Curves.easeInOut,
        child: isDarkTheme(context)
            ? Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                color: _backgroundColor(context),
                elevation: 1,
                child: _buildContent(context),
              )
            : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: answerState == AnswerState.normal
                      ? Border.all(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(.2),
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignOutside,
                        )
                      : null,
                  color: _backgroundColor(context),
                ),
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: _buildContent(context),
              ),
        // child: _buildCard(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAlphabet(context),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildAnswer(context),
                    _buildMessage(context),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              SizedBox(
                width: 24,
                height: 24,
                child: answerState == AnswerState.error
                    ? Icon(
                        Icons.close,
                        color: _textColor(context),
                      )
                    : Checkbox(
                        value: answerState == AnswerState.highlight,
                        onChanged: (_) {},
                      ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          bottom: 0,
          child: _buildCongratulation(),
        ),
      ],
    );
  }

  Widget _buildCongratulation() {
    return playAnimation
        ? SizedBox(
            height: 0,
            width: 0,
            child: OverflowBox(
              maxHeight: 200,
              maxWidth: 200,
              child: Lottie.asset(
                'assets/animations/lottie_verify_email_success.json',
                repeat: false,
              ),
            ),
          )
        : const SizedBox();
  }

  Widget _buildAlphabet(BuildContext context) {
    return Text(
      alphabet,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: _textColor(context).withOpacity(.8),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
    );
  }

  Widget _buildAnswer(BuildContext context) {
    return Text(
      answer,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: _textColor(context).withOpacity(1),
            fontSize: 14,
          ),
      textAlign: TextAlign.start,
    );
  }

  Widget _buildMessage(BuildContext context) {
    final color = isDarkTheme(context)
        ? Theme.of(context).colorScheme.surfaceTint
        : Theme.of(context).colorScheme.surfaceTint;
    return AnimatedSize(
      duration: Durations.medium1,
      alignment: Alignment.topCenter,
      curve: Curves.easeInOut,
      child: message != null
          ? Html(
              data: message,
              style: {
                'a': Style(
                    color: color,
                    textDecoration: TextDecoration.none,
                    fontSize: FontSize(12),
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w500,
                    margin: Margins.zero)
              },
              onLinkTap: (url, _, __) {
                launchUrl(Uri.parse(url!));
              },
            )
          : const SizedBox(
              width: double.infinity,
            ),
    );
  }

  Color _backgroundColor(BuildContext context) {
    return switch (answerState) {
      AnswerState.highlight => isDarkTheme(context)
          ? Theme.of(context).colorScheme.primary.withOpacity(.3)
          : Theme.of(context).colorScheme.primaryContainer.withOpacity(.65),
      AnswerState.error => Theme.of(context).colorScheme.error,
      AnswerState.normal => Theme.of(context).colorScheme.background,
    };
  }

  Color _textColor(BuildContext context) {
    return switch (answerState) {
      AnswerState.highlight => isDarkTheme(context)
          ? Theme.of(context).colorScheme.onBackground
          : Theme.of(context).colorScheme.onPrimaryContainer,
      AnswerState.error => Theme.of(context).colorScheme.onError,
      AnswerState.normal => Theme.of(context).colorScheme.onBackground,
    };
  }

  double get scale {
    return (answerState == AnswerState.highlight ||
            answerState == AnswerState.error)
        ? 1.03
        : 1.0;
  }

  bool isDarkTheme(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}

enum AnswerState { highlight, normal, error }
