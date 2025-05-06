import 'package:get/get.dart';

import '../controllers/module_reward_controller.dart';

class ModuleRewardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ModuleRewardController>(
      () => ModuleRewardController(),
    );
  }
}
