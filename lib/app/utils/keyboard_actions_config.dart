import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

KeyboardActionsConfig buildKeyboardActionConfig(
  BuildContext context,
  FocusNode nodePhone,
) {
  return KeyboardActionsConfig(
    keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
    keyboardBarColor: Colors.grey[200],
    nextFocus: true,
    actions: [
      KeyboardActionsItem(
        focusNode: nodePhone,
      ),
    ],
  );
}
