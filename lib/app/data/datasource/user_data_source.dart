import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../config/environment_config.dart';
import '../model/responses/profile_response.dart';

part 'user_data_source.g.dart';

@RestApi()
abstract class UserDataSource {
  factory UserDataSource(Dio dio) = _UserDataSource;

  @GET('${EnvironmentConfig.versionApi}/profile')
  Future<ProfileResponse> getProfile();
}
