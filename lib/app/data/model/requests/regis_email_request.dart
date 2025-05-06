import 'package:freezed_annotation/freezed_annotation.dart';

part 'regis_email_request.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createFactory: false,
)
class RegisEmailRequest {
  @JsonKey(name: 'user_phone')
  final String? userPhone;
  @JsonKey(name: 'user_name')
  final String? userName;
  @JsonKey(name: 'user_email')
  final String? userEmail;
  @JsonKey(name: 'password')
  final String? password;
  @JsonKey(name: 'birthday_date')
  final String? birthdayDate;
  @JsonKey(name: 'user_referral_code')
  final String? userReferralCode;
  @JsonKey(name: 'device_id')
  final String? deviceId;

  const RegisEmailRequest({
    this.userPhone,
    this.userName,
    this.userEmail,
    this.password,
    this.birthdayDate,
    this.userReferralCode,
    this.deviceId,
  });

  Map<String, dynamic> toJson() => _$RegisEmailRequestToJson(this);
}
