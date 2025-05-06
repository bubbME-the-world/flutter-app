// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'period_pills_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeriodPillsResponse _$PeriodPillsResponseFromJson(Map<String, dynamic> json) =>
    PeriodPillsResponse(
      code: (json['code'] as num?)?.toInt(),
      msg: json['msg'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PeriodPillsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
