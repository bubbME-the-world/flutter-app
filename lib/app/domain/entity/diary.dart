import 'package:flutter/foundation.dart' show immutable;

import 'diary_mood.dart';
import 'diary_phobia_list.dart';
import 'diary_wish_list.dart';

@immutable
class Diary {
  final DiaryMood? diaryMood;
  final int? diaryId;
  final String? diaryDate;
  final String? diaryTitle;
  final String? diaryDesc;
  final int? moodId;
  final int? userId;
  final String? createdAt;
  final String? updatedAt;
  final int? createdBy;
  final int? updatedBy;
  final List<DiaryWishList>? diaryWishList;
  final List<DiaryPhobiaList>? diaryPhobiaList;

  const Diary({
    this.diaryMood,
    this.diaryId,
    this.diaryDate,
    this.diaryTitle,
    this.diaryDesc,
    this.moodId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    this.diaryWishList,
    this.diaryPhobiaList,
  });
}
