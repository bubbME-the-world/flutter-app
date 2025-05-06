import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/core_response.dart';
import '../level_model.dart';

part 'levels_response.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class LevelsResponse extends CoreResponse<List<LevelModel>> {
  LevelsResponse({
    super.code,
    super.msg,
    super.data,
  });

  factory LevelsResponse.fromJson(Map<String, dynamic> json) =>
      _$LevelsResponseFromJson(json);
}
