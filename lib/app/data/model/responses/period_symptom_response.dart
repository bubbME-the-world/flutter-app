import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/core_response.dart';
import '../period_symptom_model.dart';

part 'period_symptom_response.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class PeriodSymptomResponse extends CoreResponse<List<PeriodSymptomModel>> {
  PeriodSymptomResponse({
    super.code,
    super.msg,
    super.data,
  });

  factory PeriodSymptomResponse.fromJson(Map<String, dynamic> json) =>
      _$PeriodSymptomResponseFromJson(json);
}
