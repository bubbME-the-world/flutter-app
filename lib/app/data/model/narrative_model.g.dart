// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'narrative_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NarrativeModel _$NarrativeModelFromJson(Map<String, dynamic> json) =>
    NarrativeModel(
      moduleSlideQuestionId:
          (json['module_slide_question_id'] as num?)?.toInt(),
      moduleContentTypeId: (json['module_content_type_id'] as num?)?.toInt(),
      moduleQuestion: json['module_question'] as String?,
      listMultipleChoice: (json['list_multiple_choice'] as List<dynamic>?)
          ?.map((e) => MultipleChoiceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      gameType: json['game_type'] as String?,
      gameData: json['game_data'] as String?,
    );

Map<String, dynamic> _$NarrativeModelToJson(NarrativeModel instance) =>
    <String, dynamic>{
      'module_slide_question_id': instance.moduleSlideQuestionId,
      'module_content_type_id': instance.moduleContentTypeId,
      'module_question': instance.moduleQuestion,
      'list_multiple_choice':
          instance.listMultipleChoice?.map((e) => e.toJson()).toList(),
      'game_type': instance.gameType,
      'game_data': instance.gameData,
    };
