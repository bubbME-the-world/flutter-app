import 'package:flutter/foundation.dart' show immutable;

import 'multiple_choice.dart';

@immutable
class Narrative {
  final int? moduleSlideQuestionId;
  final int? moduleContentTypeId;
  final String? moduleQuestion;
  final List<MultipleChoice>? listMultipleChoice;
  final String? gameType;
  final dynamic gameData;

  const Narrative({
    this.moduleSlideQuestionId,
    this.moduleContentTypeId,
    this.moduleQuestion,
    this.listMultipleChoice,
    this.gameType,
    this.gameData,
  });
}
