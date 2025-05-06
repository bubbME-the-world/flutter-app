import 'package:freezed_annotation/freezed_annotation.dart';

import 'diary_wish_list_desc_request.dart';

part 'diary_wish_list_request.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createFactory: false,
)
class DiaryWishListRequest {
  @JsonKey(name: 'diary_id')
  final int? diaryId;
  final List<DiaryWishListDescRequest>? data;

  const DiaryWishListRequest({
    this.diaryId,
    this.data,
  });

  Map<String, dynamic> toJson() => _$DiaryWishListRequestToJson(this);
}
