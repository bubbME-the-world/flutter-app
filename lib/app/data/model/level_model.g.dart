// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LevelModel _$LevelModelFromJson(Map<String, dynamic> json) => LevelModel(
      nodeId: (json['node_id'] as num?)?.toInt(),
      moduleId: (json['module_id'] as num?)?.toInt(),
      nodeTitle: json['node_title'] as String?,
      nodeDescription: json['node_description'] as String?,
      nodePrice: (json['node_price'] as num?)?.toInt(),
      isHaveQuiz: json['is_have_quiz'] as bool?,
      isLocked: json['is_locked'] as bool?,
    );

Map<String, dynamic> _$LevelModelToJson(LevelModel instance) =>
    <String, dynamic>{
      'node_id': instance.nodeId,
      'module_id': instance.moduleId,
      'node_title': instance.nodeTitle,
      'node_description': instance.nodeDescription,
      'node_price': instance.nodePrice,
      'is_have_quiz': instance.isHaveQuiz,
      'is_locked': instance.isLocked,
    };
