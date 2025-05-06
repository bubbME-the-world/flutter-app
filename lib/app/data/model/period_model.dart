import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/period.dart';

part 'period_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PeriodModel extends Equatable {
  @JsonKey(name: 'period_id')
  final int? periodId;
  @JsonKey(name: 'user_id')
  final int? userId;
  @JsonKey(name: 'start_period')
  final String? startPeriod;
  @JsonKey(name: 'end_period')
  final String? endPeriod;
  @JsonKey(name: 'batch_period')
  final String? batchPeriod;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'created_by')
  final int? createdBy;
  @JsonKey(name: 'updated_by')
  final int? updatedBy;

  const PeriodModel({
    this.periodId,
    this.userId,
    this.startPeriod,
    this.endPeriod,
    this.batchPeriod,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
  });

  factory PeriodModel.fromJson(Map<String, dynamic> json) =>
      _$PeriodModelFromJson(json);

  Map<String, dynamic> toJson() => _$PeriodModelToJson(this);

  Period toEntity() {
    return Period(
      periodId: periodId,
      userId: userId,
      startPeriod: startPeriod,
      endPeriod: endPeriod,
      batchPeriod: batchPeriod,
      createdAt: createdAt,
      updatedAt: updatedAt,
      createdBy: createdBy,
      updatedBy: updatedBy,
    );
  }

  @override
  List<Object?> get props => [
        periodId,
        userId,
        startPeriod,
        endPeriod,
        batchPeriod,
        createdAt,
        updatedAt,
        createdBy,
        updatedBy,
      ];
}
