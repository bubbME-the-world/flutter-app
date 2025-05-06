import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../shared_ui/style/app_colors.dart';
import '../../../shared_ui/style/app_images.dart';
import '../../../shared_ui/style/app_styles.dart';
import '../../../shared_ui/widgets/buttons/custom_button.dart';
import '../../../utils/ui_helpers.dart';
import '../controllers/landing_controller.dart';

class LandingView extends GetView<LandingController> {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: backgroundGradient),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                AppImages.bgLanding1,
                width: screenWidth(context),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                AppImages.bgLanding2,
                width: screenWidth(context),
              ),
            ),
            SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImages.logoTagLine,
                        height: 80.0,
                      ),
                      verticalSpace(72.0),
                      Image.asset(
                        AppImages.anteena,
                        height: 248.0,
                      ),
                      CustomButton(
                        onTap: () => controller.showLogin(),
                        height: 58.0,
                        width: screenWidthPercentage(context, percentage: .8),
                        position: 4.0.obs,
                        color: AppColors.brown,
                        colorShadow: AppColors.brownShadow,
                        label: LocaleKeys.login.tr.toUpperCase(),
                      ),
                      verticalSpace(16.0),
                      CustomButton(
                        onTap: () => controller.showRegis(),
                        height: 58.0,
                        width: screenWidthPercentage(context, percentage: .8),
                        position: 4.0.obs,
                        color: AppColors.brown,
                        colorShadow: AppColors.brownShadow,
                        label: LocaleKeys.register.tr.toUpperCase(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
