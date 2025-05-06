import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/core_response.dart';
import '../period_weight_model.dart';

part 'period_weight_response.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class PeriodWeightResponse extends CoreResponse<List<PeriodWeightModel>> {
  PeriodWeightResponse({
    super.code,
    super.msg,
    super.data,
  });

  factory PeriodWeightResponse.fromJson(Map<String, dynamic> json) =>
      _$PeriodWeightResponseFromJson(json);
}
