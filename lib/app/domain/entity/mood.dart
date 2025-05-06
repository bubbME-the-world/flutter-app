import 'package:flutter/foundation.dart' show immutable;

@immutable
class Mood {
  final int? moodId;
  final String? moodName;
  final String? moodCaption;
  final String? moodColor;
  final List<Mood>? data;

  const Mood({
    this.moodId,
    this.moodName,
    this.moodCaption,
    this.moodColor,
    this.data,
  });
}
