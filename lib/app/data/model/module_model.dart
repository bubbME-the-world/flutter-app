import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/module.dart';

part 'module_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ModuleModel extends Equatable {
  @JsonKey(name: 'module_id')
  final int? moduleId;
  @JsonKey(name: 'module_title')
  final String? moduleTitle;
  @JsonKey(name: 'module_desc')
  final String? moduleDesc;
  @JsonKey(name: 'module_price')
  final int? modulePrice;
  @JsonKey(name: 'is_locked')
  final bool? isLocked;

  const ModuleModel({
    this.moduleId,
    this.moduleTitle,
    this.moduleDesc,
    this.modulePrice,
    this.isLocked,
  });

  factory ModuleModel.fromJson(Map<String, dynamic> json) =>
      _$ModuleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ModuleModelToJson(this);

  Module toEntity() {
    return Module(
      moduleId: moduleId,
      moduleTitle: moduleTitle,
      moduleDesc: moduleDesc,
      modulePrice: modulePrice,
      isLocked: isLocked,
    );
  }

  @override
  List<Object?> get props => [
        moduleId,
        moduleTitle,
        moduleDesc,
        modulePrice,
        isLocked,
      ];
}
