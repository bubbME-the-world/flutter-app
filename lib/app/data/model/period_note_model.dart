import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/period_note.dart';

part 'period_note_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PeriodNoteModel extends Equatable {
  @JsonKey(name: 'period_note_id')
  final int? periodNoteId;
  @JsonKey(name: 'period_note')
  final String? periodNote;
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

  const PeriodNoteModel({
    this.periodNoteId,
    this.periodNote,
    this.periodId,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
  });

  factory PeriodNoteModel.fromJson(Map<String, dynamic> json) =>
      _$PeriodNoteModelFromJson(json);

  Map<String, dynamic> toJson() => _$PeriodNoteModelToJson(this);

  PeriodNote toEntity() {
    return PeriodNote(
      periodNoteId: periodNoteId,
      periodNote: periodNote,
      periodId: periodId,
      createdAt: createdAt,
      updatedAt: updatedAt,
      createdBy: createdBy,
      updatedBy: updatedBy,
    );
  }

  @override
  List<Object?> get props => [
        periodNoteId,
        periodNote,
        periodId,
        updatedAt,
        createdBy,
        updatedBy,
      ];
}
