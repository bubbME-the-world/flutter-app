import 'package:flutter/foundation.dart' show immutable;

@immutable
class PeriodWeight {
  final int? periodWeightId;
  final String? periodWeight;
  final int? periodId;
  final String? createdAt;
  final String? updatedAt;
  final int? createdBy;
  final int? updatedBy;

  const PeriodWeight({
    this.periodWeightId,
    this.periodWeight,
    this.periodId,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
  });
}
