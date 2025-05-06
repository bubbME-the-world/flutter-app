import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/core_response.dart';
import '../profile_model.dart';

part 'profile_response.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class ProfileResponse extends CoreResponse<ProfileModel> {
  ProfileResponse({
    super.code,
    super.msg,
    super.data,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
}
