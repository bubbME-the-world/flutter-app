// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_period_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddPeriodResponse _$AddPeriodResponseFromJson(Map<String, dynamic> json) =>
    AddPeriodResponse(
      code: (json['code'] as num?)?.toInt(),
      msg: json['msg'] as String?,
      data: json['data'],
      id: (json['id'] as num?)?.toInt(),
      percentagePeriod: (json['percentage_period'] as num?)?.toDouble(),
      startPeriod: json['start_period'] as String?,
      endPeriod: json['end_period'] as String?,
    );
