import 'package:freezed_annotation/freezed_annotation.dart';

part 'diary_wish_list_desc_request.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createFactory: false,
)
class DiaryWishListDescRequest {
  @JsonKey(name: 'diary_wish_list_desc')
  final String? diaryWishListDesc;

  const DiaryWishListDescRequest({
    this.diaryWishListDesc,
  });

  Map<String, dynamic> toJson() => _$DiaryWishListDescRequestToJson(this);
}
