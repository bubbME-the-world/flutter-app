import 'package:get/get.dart';

import '../controllers/my_diary_detail_controller.dart';

class MyDiaryDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyDiaryDetailController>(
      () => MyDiaryDetailController(),
    );
  }
}
