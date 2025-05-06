// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'period_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeriodResponse _$PeriodResponseFromJson(Map<String, dynamic> json) =>
    PeriodResponse(
      code: (json['code'] as num?)?.toInt(),
      msg: json['msg'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PeriodModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: (json['id'] as num?)?.toInt(),
      percentagePeriod: (json['percentage_period'] as num?)?.toDouble(),
      startPeriod: json['start_period'] as String?,
      endPeriod: json['end_period'] as String?,
      listCurrentPeriod: (json['list_current_period'] as List<dynamic>?)
          ?.map((e) => PeriodModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
