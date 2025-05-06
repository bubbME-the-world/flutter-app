import 'package:flutter/foundation.dart' show immutable;

@immutable
class Token {
  final String? accessToken;
  final String? refreshToken;
  final String? username;
  final String? message;
  final int? code;

  const Token({
    this.accessToken,
    this.refreshToken,
    this.username,
    this.message,
    this.code,
  });
}
