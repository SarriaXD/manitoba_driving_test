import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AuthTextField extends HookWidget {
  const AuthTextField({
    super.key,
    this.onChanged,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.errorText,
    this.onSubmitted,
  });

  final Function(String)? onChanged;
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final String? errorText;
  final Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final obscureText = useState(this.obscureText);
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16),
        ),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(.6),
              fontWeight: FontWeight.w600,
            ),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        // isCollapsed: true,
        errorText: errorText,
        suffixIcon: this.obscureText
            ? _SuffixIcon(
                obscureText: obscureText.value,
                onPressed: () {
                  obscureText.value = !obscureText.value;
                },
              )
            : null,
      ),
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      obscureText: obscureText.value,
      autocorrect: false,
      textCapitalization: TextCapitalization.none,
      onSubmitted: onSubmitted,
      style: Theme.of(context)
          .textTheme
          .bodyLarge
          ?.copyWith(fontWeight: FontWeight.w600),
      maxLines: 1,
    );
  }
}

class _SuffixIcon extends StatelessWidget {
  const _SuffixIcon({required this.obscureText, required this.onPressed});
  final bool obscureText;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Focus(
      canRequestFocus: false,
      descendantsAreFocusable: false,
      descendantsAreTraversable: false,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          obscureText ? Icons.visibility : Icons.visibility_off,
          color: const Color(0xFFA1A1A1),
        ),
      ),
    );
  }
}
