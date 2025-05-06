// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptom_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SymptomResponse _$SymptomResponseFromJson(Map<String, dynamic> json) =>
    SymptomResponse(
      code: (json['code'] as num?)?.toInt(),
      msg: json['msg'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SymptomModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
