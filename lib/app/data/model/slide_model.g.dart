// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slide_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SlideModel _$SlideModelFromJson(Map<String, dynamic> json) => SlideModel(
      moduleSlideId: (json['module_slide_id'] as num?)?.toInt(),
      slideName: json['slide_name'] as String?,
      moduleContentTypeId: (json['module_content_type_id'] as num?)?.toInt(),
      moduleSlideAnswer: json['module_slide_answer'] as String?,
      typeSlide: json['type_slide'] as String?,
      board: (json['board'] as List<dynamic>?)
          ?.map((e) => NarrativeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      ordering: (json['ordering'] as num?)?.toInt(),
      moduleName: json['module_name'] as String?,
      moduleId: (json['module_id'] as num?)?.toInt(),
      moduleNodeName: json['module_node_name'] as String?,
      moduleNodeId: (json['module_node_id'] as num?)?.toInt(),
      narrative: (json['Narrative'] as List<dynamic>?)
          ?.map((e) => NarrativeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SlideModelToJson(SlideModel instance) =>
    <String, dynamic>{
      'module_slide_id': instance.moduleSlideId,
      'slide_name': instance.slideName,
      'module_content_type_id': instance.moduleContentTypeId,
      'module_slide_answer': instance.moduleSlideAnswer,
      'type_slide': instance.typeSlide,
      'board': instance.board?.map((e) => e.toJson()).toList(),
      'ordering': instance.ordering,
      'module_name': instance.moduleName,
      'module_id': instance.moduleId,
      'module_node_name': instance.moduleNodeName,
      'module_node_id': instance.moduleNodeId,
      'Narrative': instance.narrative?.map((e) => e.toJson()).toList(),
    };
