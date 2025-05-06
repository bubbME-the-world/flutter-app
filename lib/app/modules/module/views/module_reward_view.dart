import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../shared_ui/style/app_colors.dart';
import '../../../shared_ui/style/app_dimens.dart';
import '../../../shared_ui/style/app_images.dart';
import '../../../shared_ui/style/app_strings.dart';
import '../../../shared_ui/style/app_styles.dart';
import '../../../shared_ui/widgets/buttons/custom_button.dart';
import '../../../utils/ui_helpers.dart';
import '../controllers/module_reward_controller.dart';

class ModuleRewardView extends GetView<ModuleRewardController> {
  const ModuleRewardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.moduleBackground,
            fit: BoxFit.fill,
            height: screenHeight(context),
            width: screenWidth(context),
          ),
          Stack(
            children: [
              SafeArea(
                child: Image.asset(
                  AppImages.moduleBoard2,
                  fit: BoxFit.cover,
                  width: screenWidth(context),
                ),
              ),
              Container(
                height: screenHeight(context),
                width: screenWidth(context),
                color: AppColors.black.withOpacity(.3),
              ),
              Obx(() {
                final score = controller.score.value;
                final coins = controller.coins.value;
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Container(
                      width: screenWidth(context),
                      decoration: BoxDecoration(
                        color: AppColors.love,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [shadow],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Material(
                          color: Colors.transparent,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${LocaleKeys.yayyYourScoreIs.tr.toUpperCase()}\n$score ${LocaleKeys.youGot.tr.toUpperCase()} $coins ${LocaleKeys.coins.tr.toUpperCase()}',
                                style: blackSansitaRegularTextStyle.copyWith(
                                  fontSize: AppDimens.title,
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              verticalSpace(24.0),
                              CustomButton(
                                onTap: () => Get.back(),
                                height: 40.0,
                                width: 120.0,
                                position: 4.0.obs,
                                color: AppColors.whiteBox,
                                colorShadow: AppColors.whiteBoxShadow,
                                textColor: AppColors.primary,
                                label: LocaleKeys.claim.tr.toUpperCase(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Hero(
              tag: AppStrings.tagAnteenaGlasses,
              child: Image.asset(
                AppImages.glassesAnteena,
                fit: BoxFit.cover,
                height: screenHeightPercentage(
                  context,
                  percentage: .40,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
