import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/core_response.dart';
import '../symptom_model.dart';

part 'symptom_response.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class SymptomResponse extends CoreResponse<List<SymptomModel>> {
  SymptomResponse({
    super.code,
    super.msg,
    super.data,
  });

  factory SymptomResponse.fromJson(Map<String, dynamic> json) =>
      _$SymptomResponseFromJson(json);
}
