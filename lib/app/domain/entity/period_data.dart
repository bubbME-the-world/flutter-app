import 'package:flutter/foundation.dart' show immutable;

import 'period.dart';

@immutable
class PeriodData {
  final int? code;
  final String? msg;
  final int? id;
  final double? percentagePeriod;
  final String? startPeriod;
  final String? endPeriod;
  final List<Period>? data;
  final List<Period>? listCurrentPeriod;

  const PeriodData({
    this.code,
    this.msg,
    this.id,
    this.percentagePeriod,
    this.startPeriod,
    this.endPeriod,
    this.data,
    this.listCurrentPeriod,
  });
}
