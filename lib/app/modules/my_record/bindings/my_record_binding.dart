import 'package:get/get.dart';

import '../controllers/my_record_controller.dart';

class MyRecordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyRecordController>(
      () => MyRecordController(),
    );
  }
}
