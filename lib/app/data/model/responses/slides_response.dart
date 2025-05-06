import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/core_response.dart';
import '../slide_model.dart';

part 'slides_response.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class SlidesResponse extends CoreResponse<List<SlideModel>> {
  SlidesResponse({
    super.code,
    super.msg,
    super.data,
  });

  factory SlidesResponse.fromJson(Map<String, dynamic> json) =>
      _$SlidesResponseFromJson(json);
}
