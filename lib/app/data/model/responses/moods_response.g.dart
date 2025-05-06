// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moods_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoodsResponse _$MoodsResponseFromJson(Map<String, dynamic> json) =>
    MoodsResponse(
      code: (json['code'] as num?)?.toInt(),
      msg: json['msg'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => MoodModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
