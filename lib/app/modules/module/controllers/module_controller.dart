import 'package:bubbme/app/shared_ui/style/app_audios.dart';
import 'package:get/get.dart';
import 'package:bubbme/app/core/service/network_exceptions.dart';

import '../../../core/base_controller.dart';
import '../../../core/request_state.dart';
import '../../../di/injectore.dart';
import '../../../domain/entity/module.dart';
import '../../../domain/usecases/modules_usecase.dart';
import '../../../routes/app_pages.dart';

class ModuleController extends BaseController {
  final _modulesUseCase = injector<ModulesUseCase>();

  final modulesState = const RequestState<List<Module>>.initial().obs;

  @override
  onInit() {
    super.onInit();
    getModules();
    setAudio(AppAudios.lectureSong);
  }

  Future<void> getModules() async {
    modulesState.value = const RequestState<List<Module>>.loading();

    final result = await _modulesUseCase.execute();
    result.fold(
      (e) {
        final errorMessage = e.errorRes?.message ?? e.error?.stringError();
        modulesState.value = RequestState.error(errorMessage);
      },
      (data) => modulesState.value = RequestState<List<Module>>.success(data),
    );
  }

  void showLevel(int moduleId) => Get.toNamed(
        Routes.MODULE_LEVEL,
        arguments: moduleId,
      );
}
