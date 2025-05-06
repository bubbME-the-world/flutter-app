// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'period_note_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeriodNoteResponse _$PeriodNoteResponseFromJson(Map<String, dynamic> json) =>
    PeriodNoteResponse(
      code: (json['code'] as num?)?.toInt(),
      msg: json['msg'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PeriodNoteModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
