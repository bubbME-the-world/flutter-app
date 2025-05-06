// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood_today_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoodTodayResponse _$MoodTodayResponseFromJson(Map<String, dynamic> json) =>
    MoodTodayResponse(
      code: (json['code'] as num?)?.toInt(),
      msg: json['msg'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => MoodModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
