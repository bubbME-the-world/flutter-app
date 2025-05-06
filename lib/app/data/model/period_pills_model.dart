import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/period_pills.dart';

part 'period_pills_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PeriodPillsModel extends Equatable {
  @JsonKey(name: 'period_pills_id')
  final int? periodPillsId;
  @JsonKey(name: 'period_pills')
  final String? periodPills;
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

  const PeriodPillsModel({
    this.periodPillsId,
    this.periodPills,
    this.periodId,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
  });

  factory PeriodPillsModel.fromJson(Map<String, dynamic> json) =>
      _$PeriodPillsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PeriodPillsModelToJson(this);

  PeriodPills toEntity() {
    return PeriodPills(
      periodPillsId: periodPillsId,
      periodPills: periodPills,
      periodId: periodId,
      createdAt: createdAt,
      updatedAt: updatedAt,
      createdBy: createdBy,
      updatedBy: updatedBy,
    );
  }

  @override
  List<Object?> get props => [
        periodPillsId,
        periodPills,
        periodId,
        updatedAt,
        createdBy,
        updatedBy,
      ];
}
