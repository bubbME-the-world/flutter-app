import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/token.dart';

part 'token_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TokenModel extends Equatable {
  final String? accessToken;
  final String? refreshToken;
  @JsonKey(name: 'user_name')
  final String? username;
  final String? message;
  final int? code;

  const TokenModel({
    this.accessToken,
    this.refreshToken,
    this.username,
    this.message,
    this.code,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenModelToJson(this);

  Token toEntity() {
    return Token(
      accessToken: accessToken,
      refreshToken: refreshToken,
      username: username,
      message: message,
      code: code,
    );
  }

  @override
  List<Object?> get props => [
        accessToken,
        refreshToken,
        username,
        message,
        code,
      ];
}
