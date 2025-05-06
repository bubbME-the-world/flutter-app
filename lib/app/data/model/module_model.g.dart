// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModuleModel _$ModuleModelFromJson(Map<String, dynamic> json) => ModuleModel(
      moduleId: (json['module_id'] as num?)?.toInt(),
      moduleTitle: json['module_title'] as String?,
      moduleDesc: json['module_desc'] as String?,
      modulePrice: (json['module_price'] as num?)?.toInt(),
      isLocked: json['is_locked'] as bool?,
    );

Map<String, dynamic> _$ModuleModelToJson(ModuleModel instance) =>
    <String, dynamic>{
      'module_id': instance.moduleId,
      'module_title': instance.moduleTitle,
      'module_desc': instance.moduleDesc,
      'module_price': instance.modulePrice,
      'is_locked': instance.isLocked,
    };
