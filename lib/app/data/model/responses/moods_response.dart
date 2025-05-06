import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/core_response.dart';
import '../mood_model.dart';

part 'moods_response.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class MoodsResponse extends CoreResponse<List<MoodModel>> {
  MoodsResponse({
    super.code,
    super.msg,
    super.data,
  });

  factory MoodsResponse.fromJson(Map<String, dynamic> json) =>
      _$MoodsResponseFromJson(json);
}
