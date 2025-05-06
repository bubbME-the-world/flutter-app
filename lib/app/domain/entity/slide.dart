import 'narrative.dart';

class Slide {
  final int? moduleSlideId;
  final String? slideName;
  final int? moduleContentTypeId;
  final String? moduleSlideAnswer;
  final String? typeSlide;
  final List<Narrative>? board;
  final int? ordering;
  final String? moduleName;
  final int? moduleId;
  final String? moduleNodeName;
  final int? moduleNodeId;
  List<Narrative>? narrative;

  Slide({
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
}
