import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createFactory: false,
)
class LoginRequest {
  @JsonKey(name: 'user_phone')
  final String? userPhone;
  @JsonKey(name: 'device_id')
  final String? deviceId;

  const LoginRequest({
    this.userPhone,
    this.deviceId,
  });

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
