import 'package:flutter/foundation.dart' show immutable;

@immutable
class PeriodPills {
  final int? periodPillsId;
  final String? periodPills;
  final int? periodId;
  final String? createdAt;
  final String? updatedAt;
  final int? createdBy;
  final int? updatedBy;

  const PeriodPills({
    this.periodPillsId,
    this.periodPills,
    this.periodId,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
  });
}
