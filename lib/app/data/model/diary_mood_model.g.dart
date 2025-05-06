// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_mood_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiaryMoodModel _$DiaryMoodModelFromJson(Map<String, dynamic> json) =>
    DiaryMoodModel(
      moodName: json['mood_name'] as String?,
      moodCaption: json['mood_caption'] as String?,
      moodSecondName: json['mood_second_name'] as String?,
      moodSecondCaption: json['mood_second_caption'] as String?,
      moodThirdName: json['mood_third_name'] as String?,
      moodThirdCaption: json['mood_third_caption'] as String?,
    );

Map<String, dynamic> _$DiaryMoodModelToJson(DiaryMoodModel instance) =>
    <String, dynamic>{
      'mood_name': instance.moodName,
      'mood_caption': instance.moodCaption,
      'mood_second_name': instance.moodSecondName,
      'mood_second_caption': instance.moodSecondCaption,
      'mood_third_name': instance.moodThirdName,
      'mood_third_caption': instance.moodThirdCaption,
    };
