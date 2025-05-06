import 'package:flutter/foundation.dart' show immutable;

@immutable
class Level {
  final int? nodeId;
  final int? moduleId;
  final String? nodeTitle;
  final String? nodeDescription;
  final int? nodePrice;
  final bool? isHaveQuiz;
  final bool? isLocked;

  const Level({
    this.nodeId,
    this.moduleId,
    this.nodeTitle,
    this.nodeDescription,
    this.nodePrice,
    this.isHaveQuiz,
    this.isLocked,
  });
}
