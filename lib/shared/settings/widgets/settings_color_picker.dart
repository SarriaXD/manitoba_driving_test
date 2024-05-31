import 'dart:io';

import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Future<Color?> showAdaptiveColorPicker(
    {required BuildContext context, required Color initialColor}) {
  return showAdaptiveDialog(
    context: context,
    builder: (context) => _SettingsColorPicker(initialColor: initialColor),
  );
}

class _SettingsColorPicker extends HookWidget {
  const _SettingsColorPicker({required this.initialColor});
  final Color initialColor;

  @override
  Widget build(BuildContext context) {
    final color = useState(initialColor);
    return Platform.isIOS
        ? _iosDialog(color, context)
        : _androidDialog(color, context);
  }

  Widget _iosDialog(ValueNotifier<Color> color, BuildContext context) {
    return CupertinoAlertDialog(
      content: AnimatedSize(
        duration: Durations.medium1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(23),
          child: ColorPicker(
            onColorChanged: (value) {
              color.value = value;
            },
            color: initialColor,
          ),
        ),
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        CupertinoDialogAction(
          onPressed: () {
            Navigator.of(context).pop(color.value);
          },
          child: const Text('Select'),
        ),
      ],
    );
  }

  Widget _androidDialog(ValueNotifier<Color> color, BuildContext context) {
    return AlertDialog(
      content: AnimatedSize(
        duration: Durations.medium1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(23),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ColorPicker(
                onColorChanged: (value) {
                  color.value = value;
                },
                color: initialColor,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(color.value);
          },
          child: const Text('Select'),
        ),
      ],
    );
  }
}
