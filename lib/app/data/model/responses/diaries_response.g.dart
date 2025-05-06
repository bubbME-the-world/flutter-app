// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diaries_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiariesResponse _$DiariesResponseFromJson(Map<String, dynamic> json) =>
    DiariesResponse(
      code: (json['code'] as num?)?.toInt(),
      msg: json['msg'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DiaryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
