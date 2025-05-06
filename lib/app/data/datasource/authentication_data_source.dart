import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../config/environment_config.dart';
import '../model/token_model.dart';

part 'authentication_data_source.g.dart';

@RestApi()
abstract class AuthenticationDataSource {
  factory AuthenticationDataSource(Dio dio) = _AuthenticationDataSource;

  @POST('${EnvironmentConfig.versionApi}/login')
  Future<TokenModel> login(@Body() Map<String, dynamic> body);

  @POST('v2/login')
  Future<TokenModel> loginEmail(@Body() Map<String, dynamic> body);

  @POST('${EnvironmentConfig.versionApi}/signup')
  Future<TokenModel> regis(@Body() Map<String, dynamic> body);

  @POST('v2/signup')
  Future<TokenModel> regisEmail(@Body() Map<String, dynamic> body);

  @POST('${EnvironmentConfig.versionApi}/verify-otp')
  Future<TokenModel> verifyOTP(@Body() Map<String, dynamic> body);
}
