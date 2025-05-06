import 'package:freezed_annotation/freezed_annotation.dart';

part 'period_pills_request.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createFactory: false,
)
class PeriodPillsRequest {
  @JsonKey(name: 'period_id')
  final int? periodId;
  @JsonKey(name: 'period_pills')
  final String? periodPills;

  const PeriodPillsRequest({
    this.periodId,
    this.periodPills,
  });

  Map<String, dynamic> toJson() => _$PeriodPillsRequestToJson(this);
}
