import 'package:get/get.dart';

import '../../my_record/controllers/my_record_menu_controller.dart';
import '../controllers/my_period_calendar_controller.dart';

class MyPeriodCalendarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyPeriodCalendarController>(
      () => MyPeriodCalendarController(),
    );
    Get.lazyPut<MyRecordMenuController>(
      () => MyRecordMenuController(),
    );
  }
}
