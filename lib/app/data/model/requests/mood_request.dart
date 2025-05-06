import 'package:freezed_annotation/freezed_annotation.dart';

part 'mood_request.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createFactory: false,
)
class MoodRequest {
  @JsonKey(name: 'mood_id')
  final int? moodId;
  @JsonKey(name: 'mood_second_id')
  final int? moodSecondId;
  @JsonKey(name: 'mood_third_id')
  final int? moodThirdId;

  const MoodRequest({
    this.moodId,
    this.moodSecondId,
    this.moodThirdId,
  });

  Map<String, dynamic> toJson() => _$MoodRequestToJson(this);
}
