import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../config/environment_config.dart';
import '../model/responses/diaries_response.dart';
import '../model/responses/diary_phobia_response.dart';
import '../model/responses/null_response.dart';
import '../model/responses/success_response.dart';

part 'diary_data_source.g.dart';

@RestApi()
abstract class DiaryDataSource {
  factory DiaryDataSource(Dio dio) = _DiaryDataSource;

  @GET('${EnvironmentConfig.versionApi}/diary')
  Future<DiariesResponse> getDiaries(@Query('diary_date') String? date);

  @GET('${EnvironmentConfig.versionApi}/diary')
  Future<DiariesResponse> getDiary(@Query('diary_id') int diaryId);

  @POST('${EnvironmentConfig.versionApi}/diary')
  Future<SuccessResponse> addDiary(@Body() Map<String, dynamic> body);

  @POST('${EnvironmentConfig.versionApi}/diary-mood')
  Future<NullResponse> addDiaryMood(@Body() Map<String, dynamic> body);

  @POST('${EnvironmentConfig.versionApi}/diary-wish-list')
  Future<NullResponse> addDiaryWishList(@Body() Map<String, dynamic> body);

  @POST('${EnvironmentConfig.versionApi}/diary-phobia-list')
  Future<NullResponse> addDiaryPhobiaList(@Body() Map<String, dynamic> body);

  @GET('${EnvironmentConfig.versionApi}/diary-phobia-list')
  Future<DiaryPhobiaResponse> getDiaryPhobiaList(@Query('diary_id') int diaryId);
}
