import 'package:get/get.dart';

import '../../../core/base_controller.dart';
import '../../../routes/app_pages.dart';

class DiaryController extends BaseController {
  void showMyDiary() => Get.offNamed(Routes.MY_DIARY);
}
