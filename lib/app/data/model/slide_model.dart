import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/slide.dart';
import 'narrative_model.dart';

part 'slide_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SlideModel extends Equatable {
  @JsonKey(name: 'module_slide_id')
  final int? moduleSlideId;
  @JsonKey(name: 'slide_name')
  final String? slideName;
  @JsonKey(name: 'module_content_type_id')
  final int? moduleContentTypeId;
  @JsonKey(name: 'module_slide_answer')
  final String? moduleSlideAnswer;
  @JsonKey(name: 'type_slide')
  final String? typeSlide;
  final List<NarrativeModel>? board;
  final int? ordering;
  @JsonKey(name: 'module_name')
  final String? moduleName;
  @JsonKey(name: 'module_id')
  final int? moduleId;
  @JsonKey(name: 'module_node_name')
  final String? moduleNodeName;
  @JsonKey(name: 'module_node_id')
  final int? moduleNodeId;
  @JsonKey(name: 'Narrative')
  final List<NarrativeModel>? narrative;

  const SlideModel({
    this.moduleSlideId,
    this.slideName,
    this.moduleContentTypeId,
    this.moduleSlideAnswer,
    this.typeSlide,
    this.board,
    this.ordering,
    this.moduleName,
    this.moduleId,
    this.moduleNodeName,
    this.moduleNodeId,
    this.narrative,
  });

  factory SlideModel.fromJson(Map<String, dynamic> json) =>
      _$SlideModelFromJson(json);

  Map<String, dynamic> toJson() => _$SlideModelToJson(this);

  Slide toEntity() {
    return Slide(
      moduleSlideId: moduleSlideId,
      slideName: slideName,
      moduleContentTypeId: moduleContentTypeId,
      moduleSlideAnswer: moduleSlideAnswer,
      typeSlide: typeSlide,
      board: board?.map((e) => e.toEntity()).toList(),
      ordering: ordering,
      moduleName: moduleName,
      moduleId: moduleId,
      moduleNodeName: moduleNodeName,
      moduleNodeId: moduleNodeId,
      narrative: narrative?.map((e) => e.toEntity()).toList(),
    );
  }

  @override
  List<Object?> get props => [
        moduleSlideId,
        slideName,
        moduleContentTypeId,
        moduleSlideAnswer,
        typeSlide,
        board,
        ordering,
        moduleName,
        moduleId,
        moduleNodeName,
        moduleNodeId,
        narrative,
      ];
}
