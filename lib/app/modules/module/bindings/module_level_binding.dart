import 'package:get/get.dart';

import '../controllers/module_level_controller.dart';

class ModuleLevelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ModuleLevelController>(
      () => ModuleLevelController(),
    );
  }
}
