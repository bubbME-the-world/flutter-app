import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/core_response.dart';
import '../mood_model.dart';

part 'mood_today_response.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class MoodTodayResponse extends CoreResponse<List<MoodModel>> {
  MoodTodayResponse({
    super.code,
    super.msg,
    super.data,
  });

  factory MoodTodayResponse.fromJson(Map<String, dynamic> json) =>
      _$MoodTodayResponseFromJson(json);
}
