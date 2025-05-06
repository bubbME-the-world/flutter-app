import 'package:freezed_annotation/freezed_annotation.dart';

part 'period_note_request.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createFactory: false,
)
class PeriodNoteRequest {
  @JsonKey(name: 'period_id')
  final int? periodId;
  final String? note;

  const PeriodNoteRequest({
    this.periodId,
    this.note,
  });

  Map<String, dynamic> toJson() => _$PeriodNoteRequestToJson(this);
}
