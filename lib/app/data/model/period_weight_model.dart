import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/period_weight.dart';

part 'period_weight_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PeriodWeightModel extends Equatable {
  @JsonKey(name: 'period_weight_id')
  final int? periodWeightId;
  @JsonKey(name: 'period_weight')
  final String? periodWeight;
  @JsonKey(name: 'period_id')
  final int? periodId;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'created_by')
  final int? createdBy;
  @JsonKey(name: 'updated_by')
  final int? updatedBy;

  const PeriodWeightModel({
    this.periodWeightId,
    this.periodWeight,
    this.periodId,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
  });

  factory PeriodWeightModel.fromJson(Map<String, dynamic> json) =>
      _$PeriodWeightModelFromJson(json);

  Map<String, dynamic> toJson() => _$PeriodWeightModelToJson(this);

  PeriodWeight toEntity() {
    return PeriodWeight(
      periodWeightId: periodWeightId,
      periodWeight: periodWeight,
      periodId: periodId,
      createdAt: createdAt,
      updatedAt: updatedAt,
      createdBy: createdBy,
      updatedBy: updatedBy,
    );
  }

  @override
  List<Object?> get props => [
        periodWeightId,
        periodWeight,
        periodId,
        updatedAt,
        createdBy,
        updatedBy,
      ];
}
