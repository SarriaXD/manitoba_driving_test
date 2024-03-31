import 'dart:io';

import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<Color?> showAdaptiveColorPicker(
    {required BuildContext context, required Color initialColor}) {
  return showAdaptiveDialog(
    context: context,
    builder: (context) => _SettingsColorPicker(initialColor: initialColor),
  );
}

class _SettingsColorPicker extends StatefulWidget {
  const _SettingsColorPicker({required this.initialColor});
  final Color initialColor;

  @override
  State<_SettingsColorPicker> createState() => _SettingsColorPickerState();
}

class _SettingsColorPickerState extends State<_SettingsColorPicker> {
  Color? _color;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? _iosDialog() : _androidDialog();
  }

  Widget _iosDialog() {
    return CupertinoAlertDialog(
      content: AnimatedSize(
        duration: Durations.medium1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(23),
          child: ColorPicker(
            onColorChanged: (value) {
              _color = value;
            },
            color: widget.initialColor,
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
            Navigator.of(context).pop(_color);
          },
          child: const Text('Select'),
        ),
      ],
    );
  }

  Widget _androidDialog() {
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
                  _color = value;
                },
                color: widget.initialColor,
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
            Navigator.of(context).pop(_color);
          },
          child: const Text('Select'),
        ),
      ],
    );
  }
}
