import 'package:flutter/foundation.dart' show immutable;

@immutable
class MultipleChoice {
  final String? answer;
  final bool? correctAnswer;

  const MultipleChoice({
    this.answer,
    this.correctAnswer,
  });
}
