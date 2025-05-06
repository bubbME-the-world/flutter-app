import 'package:get/get.dart';

import '../controllers/first_mood_controller.dart';

class FirstMoodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirstMoodController>(
      () => FirstMoodController(),
    );
  }
}
