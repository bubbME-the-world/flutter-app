import 'package:get/get.dart';

import '../controllers/regis_v2_controller.dart';

class RegisV2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisV2Controller>(
      () => RegisV2Controller(),
    );
  }
}
