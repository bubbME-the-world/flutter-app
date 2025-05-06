import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/core_response.dart';

part 'null_response.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class NullResponse extends CoreResponse {
  NullResponse({
    super.code,
    super.msg,
    super.data,
  });

  factory NullResponse.fromJson(Map<String, dynamic> json) =>
      _$NullResponseFromJson(json);
}
