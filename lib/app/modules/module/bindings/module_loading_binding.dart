import 'package:get/get.dart';

import '../controllers/module_loading_controller.dart';

class ModuleLoadingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ModuleLoadingController>(
      () => ModuleLoadingController(),
    );
  }
}
