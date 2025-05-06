import 'package:bubbme/app/shared_ui/style/app_images.dart';
import 'package:bubbme/app/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared_ui/style/app_styles.dart';
import '../../../shared_ui/widgets/custom_progress_bar.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: backgroundGradient),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              verticalSpace(124.0),
              Image.asset(AppImages.logoTagLine),
              verticalSpace(56.0),
              Obx(() {
                return CustomProgressBar(currentStep: controller.start.value);
              }),
              const Spacer(),
              Image.asset(
                AppImages.headAnteena,
                width: screenWidth(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
