import 'dart:async';

import 'package:bubbme/app/core/service/network_exceptions.dart';
import 'package:get/get.dart';

import '../../../core/base_controller.dart';
import '../../../di/injectore.dart';
import '../../../domain/entity/level.dart';
import '../../../domain/entity/slide.dart';
import '../../../domain/usecases/slides_usecase.dart';
import '../../../routes/app_pages.dart';

class ModuleLoadingController extends BaseController {
  final _slidesUseCase = injector<SlidesUseCase>();

  late Timer _timer;
  final start = 0.obs;
  final int _end = 2000;

  final levelSelected = Rx<Level?>(null);

  @override
  void onInit() {
    super.onInit();
    levelSelected.value = Get.arguments as Level;
    startLoading();
  }

  Future<void> startLoading() async {
    const oneSec = Duration(milliseconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start.value == _end) {
          getLevels();
          _timer.cancel();
        } else {
          start.value++;
        }
      },
    );
  }

  Future<void> getLevels() async {
    final result = await _slidesUseCase.execute(levelSelected.value!.nodeId!);
    result.fold(
      (e) => e.errorRes?.message ?? e.error?.stringError(),
      (data) => showRule(data),
    );
  }

  void showRule(List<Slide> data) => Get.offNamed(
        Routes.MODULE_QUIZ_RULE,
        arguments: [
          data,
          false,
        ],
      );
}
