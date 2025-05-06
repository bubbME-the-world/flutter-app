import 'package:get/get.dart';

import '../controllers/login_v2_controller.dart';

class LoginV2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginV2Controller>(
      () => LoginV2Controller(),
    );
  }
}
