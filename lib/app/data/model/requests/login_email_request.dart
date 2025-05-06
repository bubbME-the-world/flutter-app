import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_email_request.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createFactory: false,
)
class LoginEmailRequest {
  final String? email;
  final String? password;

  const LoginEmailRequest({
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() => _$LoginEmailRequestToJson(this);
}
