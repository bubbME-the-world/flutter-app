import 'package:get/get.dart';

import '../controllers/module_quiz_controller.dart';

class ModuleQuizBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ModuleQuizController>(
      () => ModuleQuizController(),
    );
  }
}
