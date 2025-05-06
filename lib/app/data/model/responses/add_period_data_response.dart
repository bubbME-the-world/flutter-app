import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/core_response.dart';
import '../../../domain/entity/add_period_data.dart';

part 'add_period_data_response.g.dart';

@JsonSerializable(
  explicitToJson: true,
  createToJson: false,
)
class AddPeriodDataResponse extends CoreResponse {
  final int? id;

  AddPeriodDataResponse({
    super.code,
    super.msg,
    super.data,
    this.id,
  });

  factory AddPeriodDataResponse.fromJson(Map<String, dynamic> json) =>
      _$AddPeriodDataResponseFromJson(json);

  AddPeriodData toEntity() {
    return AddPeriodData(
      code: code,
      msg: msg,
      id: id,
    );
  }
}
