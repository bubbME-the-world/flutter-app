import 'package:flutter/foundation.dart' show immutable;

import 'symptom.dart';

@immutable
class PeriodSymptom {
  final List<Symptom>? data;
  final int? periodId;

  const PeriodSymptom({
    this.data,
    this.periodId,
  });
}
