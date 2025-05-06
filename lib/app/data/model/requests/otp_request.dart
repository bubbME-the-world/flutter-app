import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_request.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createFactory: false,
)
class OTPRequest {
  @JsonKey(name: 'user_phone')
  final String? userPhone;
  final String? otp;
  @JsonKey(name: 'device_id')
  final String? deviceId;

  const OTPRequest({
    this.userPhone,
    this.otp,
    this.deviceId,
  });

  Map<String, dynamic> toJson() => _$OTPRequestToJson(this);
}
