import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../core/base_controller.dart';
import '../../../routes/app_pages.dart';

class RegisOnboardingController extends BaseController {
  List<String> howToPlays = [
    LocaleKeys.regisOnboardingWelcome.tr,
    LocaleKeys.regisOnboardingPlay1.tr,
    LocaleKeys.regisOnboardingPlay2.tr,
    LocaleKeys.regisOnboardingPlay3.tr,
  ];

  final RxInt currentIndex = 0.obs;

  void next() {
    if (currentIndex.value < howToPlays.length - 1) {
      currentIndex.value++;
    } else {
      showRegis();
    }
  }

  void showRegis() => Get.offNamed(Routes.REGIS_V2);
}
