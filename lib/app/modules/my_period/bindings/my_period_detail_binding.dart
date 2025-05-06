import 'package:get/get.dart';

import '../../my_record/controllers/my_record_menu_controller.dart';
import '../controllers/my_period_detail_controller.dart';

class MyPeriodDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyPeriodDetailController>(
      () => MyPeriodDetailController(),
    );
    Get.lazyPut<MyRecordMenuController>(
      () => MyRecordMenuController(),
    );
  }
}
