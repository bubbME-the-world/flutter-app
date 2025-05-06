// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'levels_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LevelsResponse _$LevelsResponseFromJson(Map<String, dynamic> json) =>
    LevelsResponse(
      code: (json['code'] as num?)?.toInt(),
      msg: json['msg'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => LevelModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
