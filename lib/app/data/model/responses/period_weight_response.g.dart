// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'period_weight_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeriodWeightResponse _$PeriodWeightResponseFromJson(
        Map<String, dynamic> json) =>
    PeriodWeightResponse(
      code: (json['code'] as num?)?.toInt(),
      msg: json['msg'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PeriodWeightModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
