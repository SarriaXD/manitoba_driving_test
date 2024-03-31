import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUpCondition extends StatelessWidget {
  const SignUpCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onBackground.withOpacity(.6),
              fontWeight: FontWeight.w500,
            ),
        children: <TextSpan>[
          const TextSpan(text: _eigteenStr),
          const TextSpan(text: _readMoreStart),
          TextSpan(
            text: 'Manitoba Driving Quiz Terms of Service',
            style: const TextStyle(
              color: Color.fromARGB(255, 3, 142, 255),
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationColor: Color.fromARGB(255, 3, 142, 255),
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // url : https://apps.mpi.mb.ca/DriverQuiz/?lang=en
                launchUrl(
                  Uri(
                    scheme: 'https',
                    host: 'apps.mpi.mb.ca',
                    path: '/DriverQuiz/',
                    queryParameters: {'lang': 'en'},
                  ),
                );
              },
          ),
          const TextSpan(text: _readMoreEnd),
        ],
      ),
    );
  }
}

const _eigteenStr =
    'I am at least 18 years old and agree to the Terms of Service and Privacy Policy: \n';

const _readMoreStart = 'By clicking agree, you agree to our ';
const _readMoreEnd = ' to use our services.';
