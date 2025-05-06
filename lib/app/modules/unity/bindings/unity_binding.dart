import 'package:get/get.dart';

import '../controllers/unity_controller.dart';

class UnityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UnityController>(
      () => UnityController(),
    );
  }
}
