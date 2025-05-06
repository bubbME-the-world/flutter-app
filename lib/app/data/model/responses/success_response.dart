import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/core_response.dart';

part 'success_response.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class SuccessResponse extends CoreResponse<List> {
  final int? id;

  SuccessResponse({
    super.code,
    super.msg,
    super.data,
    this.id,
  });

  factory SuccessResponse.fromJson(Map<String, dynamic> json) =>
      _$SuccessResponseFromJson(json);
}
