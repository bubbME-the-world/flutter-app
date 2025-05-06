import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../config/environment_config.dart';
import '../model/responses/mood_today_response.dart';
import '../model/responses/moods_response.dart';
import '../model/responses/null_response.dart';

part 'mood_data_source.g.dart';

@RestApi()
abstract class MoodDataSource {
  factory MoodDataSource(Dio dio) = _MoodDataSource;

  @GET('${EnvironmentConfig.versionApi}/mood')
  Future<MoodsResponse> getMoods();

  @POST('${EnvironmentConfig.versionApi}/mood')
  Future<NullResponse> addMood(@Body() Map<String, dynamic> body);

  @GET('${EnvironmentConfig.versionApi}/mood/today')
  Future<MoodTodayResponse> getMoodToday(@Query('date') String date);
}
