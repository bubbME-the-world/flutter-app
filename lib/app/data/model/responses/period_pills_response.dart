import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/core_response.dart';
import '../period_pills_model.dart';

part 'period_pills_response.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class PeriodPillsResponse extends CoreResponse<List<PeriodPillsModel>> {
  PeriodPillsResponse({
    super.code,
    super.msg,
    super.data,
  });

  factory PeriodPillsResponse.fromJson(Map<String, dynamic> json) =>
      _$PeriodPillsResponseFromJson(json);
}
