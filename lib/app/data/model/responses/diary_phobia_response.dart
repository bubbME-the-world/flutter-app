import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/core_response.dart';
import '../diary_model.dart';
import '../diary_phobia_list_model.dart';

part 'diary_phobia_response.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class DiaryPhobiaResponse extends CoreResponse<List<DiaryPhobiaListModel>> {
  DiaryPhobiaResponse({
    super.code,
    super.msg,
    super.data,
  });

  factory DiaryPhobiaResponse.fromJson(Map<String, dynamic> json) =>
      _$DiaryPhobiaResponseFromJson(json);
}
