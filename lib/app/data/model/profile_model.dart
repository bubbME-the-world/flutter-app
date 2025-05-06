import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/profile.dart';

part 'profile_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProfileModel extends Equatable {
  final String? name;
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  final String? birthday;
  @JsonKey(name: 'age_category')
  final String? ageCategory;

  const ProfileModel({
    this.name,
    this.phoneNumber,
    this.birthday,
    this.ageCategory,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);

  Profile toEntity() {
    return Profile(
      name: name,
      phoneNumber: phoneNumber,
      birthday: birthday,
      ageCategory: ageCategory,
    );
  }

  @override
  List<Object?> get props => [
        name,
        phoneNumber,
        birthday,
        ageCategory,
      ];
}
