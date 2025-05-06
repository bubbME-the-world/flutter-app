// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoodModel _$MoodModelFromJson(Map<String, dynamic> json) => MoodModel(
      moodId: (json['mood_id'] as num?)?.toInt(),
      moodName: json['mood_name'] as String?,
      moodCaption: json['mood_caption'] as String?,
      moodColor: json['mood_color'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => MoodModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoodModelToJson(MoodModel instance) => <String, dynamic>{
      'mood_id': instance.moodId,
      'mood_name': instance.moodName,
      'mood_caption': instance.moodCaption,
      'mood_color': instance.moodColor,
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };
