import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/core_response.dart';
import '../module_model.dart';

part 'modules_response.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class ModulesResponse extends CoreResponse<List<ModuleModel>> {
  ModulesResponse({
    super.code,
    super.msg,
    super.data,
  });

  factory ModulesResponse.fromJson(Map<String, dynamic> json) =>
      _$ModulesResponseFromJson(json);
}
