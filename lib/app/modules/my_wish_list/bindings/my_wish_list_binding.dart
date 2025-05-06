import 'package:get/get.dart';

import '../controllers/my_wish_list_controller.dart';

class MyWishListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyWishListController>(
      () => MyWishListController(),
    );
  }
}
