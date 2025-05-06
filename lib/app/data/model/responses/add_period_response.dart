import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/core_response.dart';
import '../../../domain/entity/period_data.dart';

part 'add_period_response.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class AddPeriodResponse extends CoreResponse {
  final int? id;
  @JsonKey(name: 'percentage_period')
  final double? percentagePeriod;
  @JsonKey(name: 'start_period')
  final String? startPeriod;
  @JsonKey(name: 'end_period')
  final String? endPeriod;

  AddPeriodResponse({
    super.code,
    super.msg,
    super.data,
    this.id,
    this.percentagePeriod,
    this.startPeriod,
    this.endPeriod,
  });

  factory AddPeriodResponse.fromJson(Map<String, dynamic> json) =>
      _$AddPeriodResponseFromJson(json);

  PeriodData toEntity() {
    return PeriodData(
      code: code,
      msg: msg,
      id: id,
      percentagePeriod: percentagePeriod,
      startPeriod: startPeriod,
      endPeriod: endPeriod,
    );
  }
}
