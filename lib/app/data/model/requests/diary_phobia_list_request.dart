import 'package:freezed_annotation/freezed_annotation.dart';

import 'diary_phobia_list_desc_request.dart';

part 'diary_phobia_list_request.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createFactory: false,
)
class DiaryPhobiaListRequest {
  @JsonKey(name: 'diary_id')
  final int? diaryId;
  final List<DiaryPhobiaListDescRequest>? data;

  const DiaryPhobiaListRequest({
    this.diaryId,
    this.data,
  });

  Map<String, dynamic> toJson() => _$DiaryPhobiaListRequestToJson(this);
}
