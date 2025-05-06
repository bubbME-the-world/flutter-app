import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/core_response.dart';
import '../diary_model.dart';

part 'diaries_response.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class DiariesResponse extends CoreResponse<List<DiaryModel>> {
  DiariesResponse({
    super.code,
    super.msg,
    super.data,
  });

  factory DiariesResponse.fromJson(Map<String, dynamic> json) =>
      _$DiariesResponseFromJson(json);
}
