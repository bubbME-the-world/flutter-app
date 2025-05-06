// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'success_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuccessResponse _$SuccessResponseFromJson(Map<String, dynamic> json) =>
    SuccessResponse(
      code: (json['code'] as num?)?.toInt(),
      msg: json['msg'] as String?,
      data: json['data'] as List<dynamic>?,
      id: (json['id'] as num?)?.toInt(),
    );
