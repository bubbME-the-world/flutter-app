import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/diary_mood.dart';

part 'diary_mood_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DiaryMoodModel extends Equatable {
  @JsonKey(name: 'mood_name')
  final String? moodName;
  @JsonKey(name: 'mood_caption')
  final String? moodCaption;
  @JsonKey(name: 'mood_second_name')
  final String? moodSecondName;
  @JsonKey(name: 'mood_second_caption')
  final String? moodSecondCaption;
  @JsonKey(name: 'mood_third_name')
  final String? moodThirdName;
  @JsonKey(name: 'mood_third_caption')
  final String? moodThirdCaption;

  const DiaryMoodModel({
    this.moodName,
    this.moodCaption,
    this.moodSecondName,
    this.moodSecondCaption,
    this.moodThirdName,
    this.moodThirdCaption,
  });

  factory DiaryMoodModel.fromJson(Map<String, dynamic> json) =>
      _$DiaryMoodModelFromJson(json);

  Map<String, dynamic> toJson() => _$DiaryMoodModelToJson(this);

  DiaryMood toEntity() {
    return DiaryMood(
      moodName: moodName,
      moodCaption: moodCaption,
      moodSecondName: moodSecondName,
      moodSecondCaption: moodSecondCaption,
      moodThirdName: moodThirdName,
      moodThirdCaption: moodThirdCaption,
    );
  }

  @override
  List<Object?> get props => [
        moodName,
        moodCaption,
        moodSecondName,
        moodSecondCaption,
        moodThirdName,
        moodThirdCaption,
      ];
}
