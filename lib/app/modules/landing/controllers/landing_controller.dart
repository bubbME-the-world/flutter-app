import 'package:get/get.dart';

import '../../../core/base_controller.dart';
import '../../../routes/app_pages.dart';

class LandingController extends BaseController {
  void showLogin() => Get.toNamed(Routes.LOGIN_V2);

  void showRegis() => Get.toNamed(Routes.REGIS_ONBOARDING);
}
