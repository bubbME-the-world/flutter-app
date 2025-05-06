import 'package:get/get.dart';

import '../../../core/base_controller.dart';

class ModuleRewardController extends BaseController {
  final score = 0.obs;
  final coins = 0.obs;

  @override
  void onInit() {
    super.onInit();
    score.value = Get.arguments as int;
    coins.value = score.value * 2;
  }
}
