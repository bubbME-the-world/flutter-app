import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_request.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createFactory: false,
)
class DiaryRequest {
  @JsonKey(name: 'diary_title')
  final String? diaryTitle;
  @JsonKey(name: 'diary_desc')
  final String? diaryDesc;
  @JsonKey(name: 'diary_date')
  final String? diaryDate;

  const DiaryRequest({
    this.diaryTitle,
    this.diaryDesc,
    this.diaryDate,
  });

  Map<String, dynamic> toJson() => _$DiaryRequestToJson(this);
}
