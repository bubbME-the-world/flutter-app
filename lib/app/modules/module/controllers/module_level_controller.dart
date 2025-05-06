import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bubbme/app/core/service/network_exceptions.dart';

import '../../../core/base_controller.dart';
import '../../../core/request_state.dart';
import '../../../di/injectore.dart';
import '../../../domain/entity/level.dart';
import '../../../domain/usecases/nodes_usecase.dart';
import '../../../routes/app_pages.dart';

class ModuleLevelController extends BaseController {
  final ScrollController scrollController = ScrollController();

  final _nodesUseCase = injector<NodesUseCase>();

  final nodesState = const RequestState<List<Level>>.initial().obs;

  final moduleId = Rx<int?>(null);

  @override
  onInit() {
    super.onInit();
    moduleId.value = Get.arguments as int;
    getLevels();
  }

  Future<void> getLevels() async {
    nodesState.value = const RequestState<List<Level>>.loading();

    final result = await _nodesUseCase.execute(moduleId.value!);
    result.fold(
      (e) {
        final errorMessage = e.errorRes?.message ?? e.error?.stringError();
        nodesState.value = RequestState.error(errorMessage);
      },
      (data) => nodesState.value = RequestState<List<Level>>.success(data),
    );
  }

  void showLoading(Level level) => Get.toNamed(
        Routes.MODULE_LOADING,
        arguments: level,
      );
}
