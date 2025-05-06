import 'package:freezed_annotation/freezed_annotation.dart';

part 'regis_request.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createFactory: false,
)
class RegisRequest {
  @JsonKey(name: 'user_phone')
  final String? userPhone;
  @JsonKey(name: 'user_name')
  final String? userName;
  @JsonKey(name: 'birthday_date')
  final String? birthdayDate;
  @JsonKey(name: 'user_referral_code')
  final String? userReferralCode;
  @JsonKey(name: 'device_id')
  final String? deviceId;

  const RegisRequest({
    this.userPhone,
    this.userName,
    this.birthdayDate,
    this.userReferralCode,
    this.deviceId,
  });

  Map<String, dynamic> toJson() => _$RegisRequestToJson(this);
}
