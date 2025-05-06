import 'package:flutter/foundation.dart' show immutable;

@immutable
class Symptom {
  final int? periodSymptomId;
  final int? periodSymptomID;
  final String? periodSymptomName;
  final String? createdAt;
  final String? updatedAt;
  final int? createdBy;
  final int? updatedBy;

  const Symptom({
    this.periodSymptomId,
    this.periodSymptomID,
    this.periodSymptomName,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
  });
}
