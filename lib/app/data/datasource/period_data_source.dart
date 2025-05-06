import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../config/environment_config.dart';
import '../model/responses/add_period_data_response.dart';
import '../model/responses/add_period_response.dart';
import '../model/responses/period_note_response.dart';
import '../model/responses/period_pills_response.dart';
import '../model/responses/period_response.dart';
import '../model/responses/period_symptom_response.dart';
import '../model/responses/period_weight_response.dart';
import '../model/responses/symptom_response.dart';

part 'period_data_source.g.dart';

@RestApi()
abstract class PeriodDataSource {
  factory PeriodDataSource(Dio dio) = _PeriodDataSource;

  @GET('${EnvironmentConfig.versionApi}/period')
  Future<PeriodResponse> getPeriod();

  @POST('${EnvironmentConfig.versionApi}/period')
  Future<AddPeriodResponse> setPeriod(
    @Body() Map<String, dynamic> body,
  );

  @POST('${EnvironmentConfig.versionApi}/period-note')
  Future<AddPeriodDataResponse> setNotePeriod(
    @Body() Map<String, dynamic> body,
  );

  @GET('${EnvironmentConfig.versionApi}/period-note')
  Future<PeriodNoteResponse> getNotePeriod(
    @Query('period_id') int periodId,
  );

  @POST('${EnvironmentConfig.versionApi}/period-pills')
  Future<AddPeriodDataResponse> setPillsPeriod(
    @Body() Map<String, dynamic> body,
  );

  @GET('${EnvironmentConfig.versionApi}/period-pills')
  Future<PeriodPillsResponse> getPillsPeriod(
    @Query('period_id') int periodId,
  );

  @POST('${EnvironmentConfig.versionApi}/period-weight')
  Future<AddPeriodDataResponse> setWeightPeriod(
    @Body() Map<String, dynamic> body,
  );

  @GET('${EnvironmentConfig.versionApi}/period-weight')
  Future<PeriodWeightResponse> getWeightPeriod(
    @Query('period_id') int periodId,
  );

  @POST('${EnvironmentConfig.versionApi}/period-mood')
  Future<AddPeriodDataResponse> setMoodPeriod(
    @Body() Map<String, dynamic> body,
  );

  @GET('${EnvironmentConfig.versionApi}/symptom')
  Future<SymptomResponse> getSymptom();

  @GET('${EnvironmentConfig.versionApi}/period-symptom')
  Future<PeriodSymptomResponse> getSymptomPeriod(
    @Query('period_id') int periodId,
  );

  @POST('${EnvironmentConfig.versionApi}/period-symptom')
  Future<AddPeriodDataResponse> setSymptomPeriod(
    @Body() Map<String, dynamic> body,
  );
}
