import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/core_response.dart';
import '../period_note_model.dart';

part 'period_note_response.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class PeriodNoteResponse extends CoreResponse<List<PeriodNoteModel>> {
  PeriodNoteResponse({
    super.code,
    super.msg,
    super.data,
  });

  factory PeriodNoteResponse.fromJson(Map<String, dynamic> json) =>
      _$PeriodNoteResponseFromJson(json);
}
