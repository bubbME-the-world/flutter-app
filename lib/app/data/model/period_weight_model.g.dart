// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'period_weight_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeriodWeightModel _$PeriodWeightModelFromJson(Map<String, dynamic> json) =>
    PeriodWeightModel(
      periodWeightId: (json['period_weight_id'] as num?)?.toInt(),
      periodWeight: json['period_weight'] as String?,
      periodId: (json['period_id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdBy: (json['created_by'] as num?)?.toInt(),
      updatedBy: (json['updated_by'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PeriodWeightModelToJson(PeriodWeightModel instance) =>
    <String, dynamic>{
      'period_weight_id': instance.periodWeightId,
      'period_weight': instance.periodWeight,
      'period_id': instance.periodId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };
