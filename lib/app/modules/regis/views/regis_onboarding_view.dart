import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../shared_ui/style/app_colors.dart';
import '../../../shared_ui/style/app_dimens.dart';
import '../../../shared_ui/style/app_images.dart';
import '../../../shared_ui/style/app_styles.dart';
import '../../../shared_ui/widgets/buttons/custom_button.dart';
import '../../../utils/ui_helpers.dart';
import '../controllers/regis_onboarding_controller.dart';

class RegisOnboardingView extends GetView<RegisOnboardingController> {
  const RegisOnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: backgroundGradient),
        child: Center(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  AppImages.bgRegisEllipse,
                  width: screenWidth(context),
                ),
              ),
              SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SizedBox(
                        height: 48.0,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: IconButton(
                                icon: Image.asset(AppImages.iconBackWhite),
                                onPressed: () => Get.back(),
                              ),
                            ),
                            Center(
                              child: Text(
                                LocaleKeys.welcome.tr.toUpperCase(),
                                style: blackSansitaRegularTextStyle.copyWith(
                                  fontSize: AppDimens.title,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Obx(() {
                      final description =
                          controller.howToPlays[controller.currentIndex.value];

                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Stack(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: screenWidth(context),
                                    decoration: const BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(32.0),
                                        topRight: Radius.circular(32.0),
                                        bottomLeft: Radius.circular(32.0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 24.0,
                                        horizontal: 32.0,
                                      ),
                                      child: Text(
                                        description,
                                        style: blackSansitaRegularTextStyle
                                            .copyWith(
                                          fontSize: AppDimens.subHeadline,
                                        ),
                                      ),
                                    ),
                                  ),
                                  verticalSpace(48.0),
                                ],
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomButton(
                                      onTap: () => controller.next(),
                                      position: 4.0.obs,
                                      width: 140.0,
                                      color: AppColors.whiteBox,
                                      colorShadow: AppColors.whiteBoxShadow,
                                      label: LocaleKeys.next.tr.toUpperCase(),
                                      textColor: AppColors.primary,
                                    ),
                                    Image.asset(
                                      AppImages.anteenaFull,
                                      width: screenWidthPercentage(
                                        context,
                                        percentage: 0.45,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
