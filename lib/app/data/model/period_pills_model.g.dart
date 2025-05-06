// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'period_pills_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeriodPillsModel _$PeriodPillsModelFromJson(Map<String, dynamic> json) =>
    PeriodPillsModel(
      periodPillsId: (json['period_pills_id'] as num?)?.toInt(),
      periodPills: json['period_pills'] as String?,
      periodId: (json['period_id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdBy: (json['created_by'] as num?)?.toInt(),
      updatedBy: (json['updated_by'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PeriodPillsModelToJson(PeriodPillsModel instance) =>
    <String, dynamic>{
      'period_pills_id': instance.periodPillsId,
      'period_pills': instance.periodPills,
      'period_id': instance.periodId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };
