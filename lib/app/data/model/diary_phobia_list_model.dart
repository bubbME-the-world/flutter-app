import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/diary_phobia_list.dart';

part 'diary_phobia_list_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DiaryPhobiaListModel extends Equatable {
  @JsonKey(name: 'diary_phobia_list_desc')
  final String? diaryPhobiaListDesc;

  const DiaryPhobiaListModel({
    this.diaryPhobiaListDesc,
  });

  factory DiaryPhobiaListModel.fromJson(Map<String, dynamic> json) =>
      _$DiaryPhobiaListModelFromJson(json);

  Map<String, dynamic> toJson() => _$DiaryPhobiaListModelToJson(this);

  DiaryPhobiaList toEntity() {
    return DiaryPhobiaList(
      diaryPhobiaListDesc: diaryPhobiaListDesc,
    );
  }

  @override
  List<Object?> get props => [
        diaryPhobiaListDesc,
      ];
}
