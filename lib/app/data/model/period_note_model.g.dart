// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'period_note_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeriodNoteModel _$PeriodNoteModelFromJson(Map<String, dynamic> json) =>
    PeriodNoteModel(
      periodNoteId: (json['period_note_id'] as num?)?.toInt(),
      periodNote: json['period_note'] as String?,
      periodId: (json['period_id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdBy: (json['created_by'] as num?)?.toInt(),
      updatedBy: (json['updated_by'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PeriodNoteModelToJson(PeriodNoteModel instance) =>
    <String, dynamic>{
      'period_note_id': instance.periodNoteId,
      'period_note': instance.periodNote,
      'period_id': instance.periodId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };
