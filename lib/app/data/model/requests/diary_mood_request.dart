import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_mood_request.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createFactory: false,
)
class DiaryMoodRequest {
  @JsonKey(name: 'mood_id')
  final int? moodId;
  @JsonKey(name: 'mood_second_id')
  final int? moodSecondId;
  @JsonKey(name: 'mood_third_id')
  final int? moodThirdId;
  @JsonKey(name: 'diary_id')
  final int? diaryId;

  const DiaryMoodRequest({
    this.moodId,
    this.moodSecondId,
    this.moodThirdId,
    this.diaryId,
  });

  Map<String, dynamic> toJson() => _$DiaryMoodRequestToJson(this);
}
