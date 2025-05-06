import 'package:get/get.dart';

import '../../../core/base_controller.dart';
import '../../../domain/entity/period.dart';

class MyRecordDetailController extends BaseController {
  final period = Rx<Period?>(null);

  @override
  void onInit() {
    super.onInit();
    period.value = Get.arguments as Period;
    getProfileLocal();
  }
}
