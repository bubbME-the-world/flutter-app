import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/core_response.dart';
import '../../../domain/entity/period_data.dart';
import '../period_model.dart';

part 'period_response.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class PeriodResponse extends CoreResponse<List<PeriodModel>> {
  final int? id;
  @JsonKey(name: 'percentage_period')
  final double? percentagePeriod;
  @JsonKey(name: 'start_period')
  final String? startPeriod;
  @JsonKey(name: 'end_period')
  final String? endPeriod;
  @JsonKey(name: 'list_current_period')
  final List<PeriodModel>? listCurrentPeriod;

  PeriodResponse({
    super.code,
    super.msg,
    super.data,
    this.id,
    this.percentagePeriod,
    this.startPeriod,
    this.endPeriod,
    this.listCurrentPeriod,
  });

  factory PeriodResponse.fromJson(Map<String, dynamic> json) =>
      _$PeriodResponseFromJson(json);

  PeriodData toEntity() {
    return PeriodData(
      code: code,
      msg: msg,
      data: data?.map((e) => e.toEntity()).toList() ?? [],
      id: id,
      percentagePeriod: percentagePeriod,
      startPeriod: startPeriod,
      endPeriod: endPeriod,
      listCurrentPeriod:
          listCurrentPeriod?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}
