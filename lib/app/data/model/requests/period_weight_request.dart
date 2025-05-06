import 'package:freezed_annotation/freezed_annotation.dart';

part 'period_weight_request.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createFactory: false,
)
class PeriodWeightRequest {
  @JsonKey(name: 'period_id')
  final int? periodId;
  @JsonKey(name: 'period_weight')
  final String? periodWeight;

  const PeriodWeightRequest({
    this.periodId,
    this.periodWeight,
  });

  Map<String, dynamic> toJson() => _$PeriodWeightRequestToJson(this);
}
