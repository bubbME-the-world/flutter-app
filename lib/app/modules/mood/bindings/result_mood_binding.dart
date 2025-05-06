import 'package:get/get.dart';

import '../controllers/result_mood_controller.dart';

class ResultMoodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResultMoodController>(
      () => ResultMoodController(),
    );
  }
}
