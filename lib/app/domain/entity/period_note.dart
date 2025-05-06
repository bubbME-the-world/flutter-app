import 'package:flutter/foundation.dart' show immutable;

@immutable
class PeriodNote {
  final int? periodNoteId;
  final String? periodNote;
  final int? periodId;
  final String? createdAt;
  final String? updatedAt;
  final int? createdBy;
  final int? updatedBy;

  const PeriodNote({
    this.periodNoteId,
    this.periodNote,
    this.periodId,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
  });
}
