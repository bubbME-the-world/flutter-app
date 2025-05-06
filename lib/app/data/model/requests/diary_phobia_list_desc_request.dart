import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_phobia_list_desc_request.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createFactory: false,
)
class DiaryPhobiaListDescRequest {
  @JsonKey(name: 'diary_phobia_list_desc')
  final String? diaryPhobiaListDesc;

  const DiaryPhobiaListDescRequest({
    this.diaryPhobiaListDesc,
  });

  Map<String, dynamic> toJson() => _$DiaryPhobiaListDescRequestToJson(this);
}
