import 'package:get/get.dart';

import '../../../core/base_controller.dart';
import '../../../domain/entity/mood.dart';
import '../../../routes/app_pages.dart';

class ResultMoodController extends BaseController {
  Mood moodSelected = Get.arguments as Mood;

  void showHome() => Get.offAllNamed(Routes.HOME);
}
