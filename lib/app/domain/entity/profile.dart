import 'package:flutter/foundation.dart' show immutable;

@immutable
class Profile {
  final String? name;
  final String? phoneNumber;
  final String? birthday;
  final String? ageCategory;

  const Profile({
    this.name,
    this.phoneNumber,
    this.birthday,
    this.ageCategory,
  });
}
