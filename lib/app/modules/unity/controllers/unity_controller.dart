import 'package:bubbme/app/core/base_controller.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class UnityController extends BaseController {
  @override
  void onInit() {
    super.onInit();
    getProfileLocal();
  }
  void navigateTo(String key, String value) {
    if (key == 'REQUEST_SCENE') {
      if (value == 'PERIOD') {
        showPeriod();
      } else if (value == 'DIARY') {
        showDiary();
      } else if (value == 'LECTURE') {
        showModule();
        }
    }
  }

  void showPeriod() => Get.toNamed(Routes.PERIOD);

  void showDiary() => Get.toNamed(Routes.DIARY);

  void showModule() => Get.toNamed(Routes.MODULE);
}
