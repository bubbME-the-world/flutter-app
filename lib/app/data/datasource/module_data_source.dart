import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../config/environment_config.dart';
import '../model/responses/levels_response.dart';
import '../model/responses/modules_response.dart';
import '../model/responses/slides_response.dart';

part 'module_data_source.g.dart';

@RestApi()
abstract class ModuleDataSource {
  factory ModuleDataSource(Dio dio) = _ModuleDataSource;

  @GET('${EnvironmentConfig.versionApi}/module')
  Future<ModulesResponse> getModules();

  @GET('${EnvironmentConfig.versionApi}/module/node/{moduleId}')
  Future<LevelsResponse> getLevels(@Path('moduleId') int id);

  @GET('${EnvironmentConfig.versionApi}/module/node/slide/{nodeId}')
  Future<SlidesResponse> getSlides(@Path('nodeId') int id);
}
