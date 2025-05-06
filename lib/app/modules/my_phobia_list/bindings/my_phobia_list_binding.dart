import 'package:get/get.dart';

import '../controllers/my_phobia_list_controller.dart';

class MyPhobiaListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyPhobiaListController>(
      () => MyPhobiaListController(),
    );
  }
}
