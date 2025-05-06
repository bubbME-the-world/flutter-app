import 'package:bubbme/app/domain/entity/module.dart';
import 'package:bubbme/app/domain/entity/level.dart';
import 'package:bubbme/app/domain/entity/slide.dart';
import 'package:dartz/dartz.dart';

import '../../core/service/network_exceptions.dart';
import '../../domain/repositories/module_repository.dart';
import '../../utils/type_defs.dart';
import '../datasource/module_data_source.dart';
import '../model/responses/failure_response.dart';

class ModuleRepositoryImpl extends ModuleRepository {
  final ModuleDataSource _dataSource;

  ModuleRepositoryImpl({
    required ModuleDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  FutureEither<List<Module>> getModules() async {
    try {
      final response = await _dataSource.getModules();
      return right(response.data!.map((e) => e.toEntity()).toList());
    } catch (e) {
      return left(
        FailureResponse(
          error: NetworkExceptions.getDioException(e),
          errorRes: NetworkExceptions.getErrorRes(e),
        ),
      );
    }
  }

  @override
  FutureEither<List<Level>> getLevels(int moduleId) async {
    try {
      final response = await _dataSource.getLevels(moduleId);
      final listData = response.data!.map((e) => e.toEntity()).toList();
      print('SIZE LIST DATA: ${listData.length}');
      return right(listData);
    } catch (e) {
      return left(
        FailureResponse(
          error: NetworkExceptions.getDioException(e),
          errorRes: NetworkExceptions.getErrorRes(e),
        ),
      );
    }
  }

  @override
  FutureEither<List<Slide>> getSlides(int nodeId) async {
    try {
      final response = await _dataSource.getSlides(nodeId);
      return right(response.data!.map((e) => e.toEntity()).toList());
    } catch (e) {
      return left(
        FailureResponse(
          error: NetworkExceptions.getDioException(e),
          errorRes: NetworkExceptions.getErrorRes(e),
        ),
      );
    }
  }
}
