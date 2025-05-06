import 'package:get/get.dart';

import '../controllers/my_record_detail_controller.dart';
import '../controllers/my_record_menu_controller.dart';

class MyRecordDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyRecordDetailController>(
      () => MyRecordDetailController(),
    );
    Get.lazyPut<MyRecordMenuController>(
      () => MyRecordMenuController(),
    );
  }
}
