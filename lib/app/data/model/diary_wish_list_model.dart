import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/diary_wish_list.dart';

part 'diary_wish_list_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DiaryWishListModel extends Equatable {
  @JsonKey(name: 'diary_wish_list_desc')
  final String? diaryWishListDesc;

  const DiaryWishListModel({
    this.diaryWishListDesc,
  });

  factory DiaryWishListModel.fromJson(Map<String, dynamic> json) =>
      _$DiaryWishListModelFromJson(json);

  Map<String, dynamic> toJson() => _$DiaryWishListModelToJson(this);

  DiaryWishList toEntity() {
    return DiaryWishList(
      diaryWishListDesc: diaryWishListDesc,
    );
  }

  @override
  List<Object?> get props => [
        diaryWishListDesc,
      ];
}
