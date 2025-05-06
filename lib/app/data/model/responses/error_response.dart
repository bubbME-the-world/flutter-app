import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_response.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class ErrorResponse {
  bool? error;
  int? code;
  String? message;

  ErrorResponse({
    this.error,
    this.code,
    this.message,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);
}
