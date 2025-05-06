// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modules_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModulesResponse _$ModulesResponseFromJson(Map<String, dynamic> json) =>
    ModulesResponse(
      code: (json['code'] as num?)?.toInt(),
      msg: json['msg'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ModuleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
