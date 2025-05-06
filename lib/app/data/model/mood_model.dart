import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/mood.dart';

part 'mood_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MoodModel extends Equatable {
  @JsonKey(name: 'mood_id')
  final int? moodId;
  @JsonKey(name: 'mood_name')
  final String? moodName;
  @JsonKey(name: 'mood_caption')
  final String? moodCaption;
  @JsonKey(name: 'mood_color')
  final String? moodColor;
  final List<MoodModel>? data;

  const MoodModel({
    this.moodId,
    this.moodName,
    this.moodCaption,
    this.moodColor,
    this.data,
  });

  factory MoodModel.fromJson(Map<String, dynamic> json) =>
      _$MoodModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoodModelToJson(this);

  Mood toEntity() {
    return Mood(
      moodId: moodId,
      moodName: moodName,
      moodCaption: moodCaption,
      moodColor: moodColor,
      data: data?.map((e) => e.toEntity()).toList(),
    );
  }

  @override
  List<Object?> get props => [
        moodId,
        moodName,
        moodCaption,
        moodColor,
        data,
      ];
}
