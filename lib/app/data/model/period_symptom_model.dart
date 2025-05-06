import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/period_symptom.dart';
import 'symptom_model.dart';

part 'period_symptom_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PeriodSymptomModel extends Equatable {
  final List<SymptomModel>? data;
  @JsonKey(name: 'period_id')
  final int? periodId;

  const PeriodSymptomModel({
    this.data,
    this.periodId,
  });

  factory PeriodSymptomModel.fromJson(Map<String, dynamic> json) =>
      _$PeriodSymptomModelFromJson(json);

  Map<String, dynamic> toJson() => _$PeriodSymptomModelToJson(this);

  PeriodSymptom toEntity() {
    return PeriodSymptom(
      data: data?.map((e) => e.toEntity()).toList(),
      periodId: periodId,
    );
  }

  @override
  List<Object?> get props => [
        data,
        periodId,
      ];
}
