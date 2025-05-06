import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/symptom.dart';

part 'symptom_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SymptomModel extends Equatable {
  @JsonKey(name: 'period_symptom_id')
  final int? periodSymptomId;
  @JsonKey(name: 'period_symptomID')
  final int? periodSymptomID;
  @JsonKey(name: 'period_symptom_name')
  final String? periodSymptomName;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'created_by')
  final int? createdBy;
  @JsonKey(name: 'updated_by')
  final int? updatedBy;

  const SymptomModel({
    this.periodSymptomId,
    this.periodSymptomID,
    this.periodSymptomName,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
  });

  factory SymptomModel.fromJson(Map<String, dynamic> json) =>
      _$SymptomModelFromJson(json);

  Map<String, dynamic> toJson() => _$SymptomModelToJson(this);

  Symptom toEntity() {
    return Symptom(
      periodSymptomId: periodSymptomId,
      periodSymptomID: periodSymptomID,
      periodSymptomName: periodSymptomName,
      createdAt: createdAt,
      updatedAt: updatedAt,
      createdBy: createdBy,
      updatedBy: updatedBy,
    );
  }

  @override
  List<Object?> get props => [
        periodSymptomId,
        periodSymptomID,
        periodSymptomName,
        updatedAt,
        createdBy,
        updatedBy,
      ];
}
