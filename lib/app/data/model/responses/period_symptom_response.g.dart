// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'period_symptom_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeriodSymptomResponse _$PeriodSymptomResponseFromJson(
        Map<String, dynamic> json) =>
    PeriodSymptomResponse(
      code: (json['code'] as num?)?.toInt(),
      msg: json['msg'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PeriodSymptomModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
