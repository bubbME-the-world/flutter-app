import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/level.dart';

part 'level_model.g.dart';

@JsonSerializable(explicitToJson: true)
class LevelModel extends Equatable {
  @JsonKey(name: 'node_id')
  final int? nodeId;
  @JsonKey(name: 'module_id')
  final int? moduleId;
  @JsonKey(name: 'node_title')
  final String? nodeTitle;
  @JsonKey(name: 'node_description')
  final String? nodeDescription;
  @JsonKey(name: 'node_price')
  final int? nodePrice;
  @JsonKey(name: 'is_have_quiz')
  final bool? isHaveQuiz;
  @JsonKey(name: 'is_locked')
  final bool? isLocked;

  const LevelModel({
    this.nodeId,
    this.moduleId,
    this.nodeTitle,
    this.nodeDescription,
    this.nodePrice,
    this.isHaveQuiz,
    this.isLocked,
  });

  factory LevelModel.fromJson(Map<String, dynamic> json) =>
      _$LevelModelFromJson(json);

  Map<String, dynamic> toJson() => _$LevelModelToJson(this);

  Level toEntity() {
    return Level(
      nodeId: nodeId,
      moduleId: moduleId,
      nodeTitle: nodeTitle,
      nodeDescription: nodeDescription,
      nodePrice: nodePrice,
      isHaveQuiz: isHaveQuiz,
      isLocked: isLocked,
    );
  }

  @override
  List<Object?> get props => [
        nodeId,
        moduleId,
        nodeTitle,
        nodeDescription,
        nodePrice,
        isHaveQuiz,
        isLocked,
      ];
}
