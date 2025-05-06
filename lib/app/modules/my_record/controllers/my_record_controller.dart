import 'package:get/get.dart';

import '../../../core/base_controller.dart';
import '../../../domain/entity/period.dart';
import '../../../routes/app_pages.dart';

class MyRecordController extends BaseController {
  final periodRecords = Rx<List<Period>?>(null);

  @override
  void onInit() {
    super.onInit();
    periodRecords.value = Get.arguments as List<Period>;
    getProfileLocal();
  }

  void showDetail(Period period) => Get.toNamed(
        Routes.MY_RECORD_DETAIL,
        arguments: period,
      );
}
