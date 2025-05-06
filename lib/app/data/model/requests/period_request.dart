import 'package:freezed_annotation/freezed_annotation.dart';

part 'period_request.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createFactory: false,
)
class PeriodRequest {
  @JsonKey(name: 'start_period')
  final String? startPeriod;
  @JsonKey(name: 'end_period')
  final String? endPeriod;

  const PeriodRequest({
    this.startPeriod,
    this.endPeriod,
  });

  Map<String, dynamic> toJson() => _$PeriodRequestToJson(this);
}
