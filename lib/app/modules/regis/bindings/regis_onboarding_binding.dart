import 'package:get/get.dart';

import '../controllers/regis_onboarding_controller.dart';

class RegisOnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisOnboardingController>(
      () => RegisOnboardingController(),
    );
  }
}
