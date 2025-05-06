import 'package:freezed_annotation/freezed_annotation.dart';

part 'period_symptom_request.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createFactory: false,
)
class PeriodSymptomRequest {
  @JsonKey(name: 'period_id')
  final int? periodId;
  @JsonKey(name: 'period_symptom')
  final List<int>? periodSymptom;

  const PeriodSymptomRequest({
    this.periodId,
    this.periodSymptom,
  });

  Map<String, dynamic> toJson() => _$PeriodSymptomRequestToJson(this);
}
