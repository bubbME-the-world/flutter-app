import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/diary.dart';
import 'diary_mood_model.dart';
import 'diary_phobia_list_model.dart';
import 'diary_wish_list_model.dart';

part 'diary_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DiaryModel extends Equatable {
  @JsonKey(name: 'diary_mood')
  final DiaryMoodModel? diaryMood;
  @JsonKey(name: 'diary_id')
  final int? diaryId;
  @JsonKey(name: 'diary_date')
  final String? diaryDate;
  @JsonKey(name: 'diary_title')
  final String? diaryTitle;
  @JsonKey(name: 'diary_desc')
  final String? diaryDesc;
  @JsonKey(name: 'mood_id')
  final int? moodId;
  @JsonKey(name: 'user_id')
  final int? userId;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'created_by')
  final int? createdBy;
  @JsonKey(name: 'updated_by')
  final int? updatedBy;
  @JsonKey(name: 'diary_wish_list')
  final List<DiaryWishListModel>? diaryWishList;
  @JsonKey(name: 'diary_phobia')
  final List<DiaryPhobiaListModel>? diaryPhobiaList;

  const DiaryModel({
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

  factory DiaryModel.fromJson(Map<String, dynamic> json) =>
      _$DiaryModelFromJson(json);

  Map<String, dynamic> toJson() => _$DiaryModelToJson(this);

  Diary toEntity() {
    return Diary(
      diaryMood: diaryMood?.toEntity(),
      diaryId: diaryId,
      diaryDate: diaryDate,
      diaryTitle: diaryTitle,
      diaryDesc: diaryDesc,
      moodId: moodId,
      userId: userId,
      createdAt: createdAt,
      updatedAt: updatedAt,
      createdBy: createdBy,
      updatedBy: updatedBy,
      diaryWishList: diaryWishList?.map((e) => e.toEntity()).toList(),
      diaryPhobiaList: diaryPhobiaList?.map((e) => e.toEntity()).toList(),
    );
  }

  @override
  List<Object?> get props => [
        diaryMood,
        diaryId,
        diaryDate,
        diaryTitle,
        diaryDesc,
        moodId,
        userId,
        createdAt,
        updatedAt,
        createdBy,
        updatedBy,
        diaryWishList,
        diaryPhobiaList,
      ];
}
