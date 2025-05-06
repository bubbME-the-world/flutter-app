import 'package:flutter/foundation.dart' show immutable;

@immutable
class Module {
  final int? moduleId;
  final String? moduleTitle;
  final String? moduleDesc;
  final int? modulePrice;
  final bool? isLocked;

  const Module({
    this.moduleId,
    this.moduleTitle,
    this.moduleDesc,
    this.modulePrice,
    this.isLocked,
  });
}
