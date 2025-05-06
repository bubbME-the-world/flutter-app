// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'period_symptom_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeriodSymptomModel _$PeriodSymptomModelFromJson(Map<String, dynamic> json) =>
    PeriodSymptomModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SymptomModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      periodId: (json['period_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PeriodSymptomModelToJson(PeriodSymptomModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'period_id': instance.periodId,
    };
