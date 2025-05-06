// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'period_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeriodModel _$PeriodModelFromJson(Map<String, dynamic> json) => PeriodModel(
      periodId: (json['period_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      startPeriod: json['start_period'] as String?,
      endPeriod: json['end_period'] as String?,
      batchPeriod: json['batch_period'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdBy: (json['created_by'] as num?)?.toInt(),
      updatedBy: (json['updated_by'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PeriodModelToJson(PeriodModel instance) =>
    <String, dynamic>{
      'period_id': instance.periodId,
      'user_id': instance.userId,
      'start_period': instance.startPeriod,
      'end_period': instance.endPeriod,
      'batch_period': instance.batchPeriod,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };
