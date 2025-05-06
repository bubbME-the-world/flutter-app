// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_phobia_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiaryPhobiaResponse _$DiaryPhobiaResponseFromJson(Map<String, dynamic> json) =>
    DiaryPhobiaResponse(
      code: (json['code'] as num?)?.toInt(),
      msg: json['msg'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DiaryPhobiaListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
