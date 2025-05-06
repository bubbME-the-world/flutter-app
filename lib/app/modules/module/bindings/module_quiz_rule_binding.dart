import 'package:get/get.dart';

import '../controllers/module_quiz_rule_controller.dart';

class ModuleQuizRuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ModuleQuizRuleController>(
      () => ModuleQuizRuleController(),
    );
  }
}
