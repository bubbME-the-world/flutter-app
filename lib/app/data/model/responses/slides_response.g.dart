// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slides_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SlidesResponse _$SlidesResponseFromJson(Map<String, dynamic> json) =>
    SlidesResponse(
      code: (json['code'] as num?)?.toInt(),
      msg: json['msg'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SlideModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
