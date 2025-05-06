import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/narrative.dart';
import 'multiple_choice_model.dart';

part 'narrative_model.g.dart';

@JsonSerializable(explicitToJson: true)
class NarrativeModel extends Equatable {
  @JsonKey(name: 'module_slide_question_id')
  final int? moduleSlideQuestionId;
  @JsonKey(name: 'module_content_type_id')
  final int? moduleContentTypeId;
  @JsonKey(name: 'module_question')
  final String? moduleQuestion;
  @JsonKey(name: 'list_multiple_choice')
  final List<MultipleChoiceModel>? listMultipleChoice;
  @JsonKey(name: 'game_type')
  final String? gameType;
  @JsonKey(name: 'game_data')
  final String? gameData;

  const NarrativeModel({
    this.moduleSlideQuestionId,
    this.moduleContentTypeId,
    this.moduleQuestion,
    this.listMultipleChoice,
    this.gameType,
    this.gameData,
  });

  factory NarrativeModel.fromJson(Map<String, dynamic> json) =>
      _$NarrativeModelFromJson(json);

  Map<String, dynamic> toJson() => _$NarrativeModelToJson(this);

  Narrative toEntity() {
    return Narrative(
      moduleSlideQuestionId: moduleSlideQuestionId,
      moduleContentTypeId: moduleContentTypeId,
      moduleQuestion: moduleQuestion,
      listMultipleChoice: listMultipleChoice?.map((e) => e.toEntity()).toList(),
      gameType: gameType,
      gameData: gameData,
    );
  }

  @override
  List<Object?> get props => [
        moduleSlideQuestionId,
        moduleContentTypeId,
        moduleQuestion,
        listMultipleChoice,
        gameType,
        gameData,
      ];
}
