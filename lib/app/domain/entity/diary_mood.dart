import 'package:flutter/foundation.dart' show immutable;

@immutable
class DiaryMood {
  final String? moodName;
  final String? moodCaption;
  final String? moodSecondName;
  final String? moodSecondCaption;
  final String? moodThirdName;
  final String? moodThirdCaption;

  const DiaryMood({
    this.moodName,
    this.moodCaption,
    this.moodSecondName,
    this.moodSecondCaption,
    this.moodThirdName,
    this.moodThirdCaption,
  });
}
