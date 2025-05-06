import 'package:flutter/foundation.dart' show immutable;

@immutable
class Period {
  final int? periodId;
  final int? userId;
  final String? startPeriod;
  final String? endPeriod;
  final String? batchPeriod;
  final String? createdAt;
  final String? updatedAt;
  final int? createdBy;
  final int? updatedBy;

  const Period({
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
}
