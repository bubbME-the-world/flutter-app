import 'package:flutter/foundation.dart' show immutable;

@immutable
class AddPeriodData {
  final int? code;
  final String? msg;
  final int? id;

  const AddPeriodData({
    this.code,
    this.msg,
    this.id,
  });
}
