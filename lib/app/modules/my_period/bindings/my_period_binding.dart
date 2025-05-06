import 'package:get/get.dart';

import '../controllers/my_period_controller.dart';

class MyPeriodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyPeriodController>(
      () => MyPeriodController(),
    );
  }
}
