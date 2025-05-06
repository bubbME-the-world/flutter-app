import 'package:get/get.dart';

import '../controllers/module_learning_controller.dart';

class ModuleLearningBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ModuleLearningController>(
      () => ModuleLearningController(),
    );
  }
}
