import 'package:freezed_annotation/freezed_annotation.dart';

part 'period_mood_request.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createFactory: false,
)
class PeriodMoodRequest {
  @JsonKey(name: 'period_id')
  final int? periodId;
  @JsonKey(name: 'mood_id')
  final int? moodId;
  @JsonKey(name: 'mood_second_id')
  final int? moodSecondId;
  @JsonKey(name: 'mood_third_id')
  final int? moodThirdId;

  const PeriodMoodRequest({
    this.periodId,
    this.moodId,
    this.moodSecondId,
    this.moodThirdId,
  });

  Map<String, dynamic> toJson() => _$PeriodMoodRequestToJson(this);
}
