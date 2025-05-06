// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptom_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SymptomModel _$SymptomModelFromJson(Map<String, dynamic> json) => SymptomModel(
      periodSymptomId: (json['period_symptom_id'] as num?)?.toInt(),
      periodSymptomID: (json['period_symptomID'] as num?)?.toInt(),
      periodSymptomName: json['period_symptom_name'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdBy: (json['created_by'] as num?)?.toInt(),
      updatedBy: (json['updated_by'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SymptomModelToJson(SymptomModel instance) =>
    <String, dynamic>{
      'period_symptom_id': instance.periodSymptomId,
      'period_symptomID': instance.periodSymptomID,
      'period_symptom_name': instance.periodSymptomName,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };
