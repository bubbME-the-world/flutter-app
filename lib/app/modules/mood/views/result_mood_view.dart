import 'package:bubbme/app/shared_ui/style/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../shared_ui/style/app_colors.dart';
import '../../../shared_ui/style/app_images.dart';
import '../../../shared_ui/style/app_styles.dart';
import '../../../shared_ui/widgets/buttons/custom_button.dart';
import '../../../utils/ui_helpers.dart';
import '../controllers/result_mood_controller.dart';

class ResultMoodView extends GetView<ResultMoodController> {
  const ResultMoodView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: backgroundGradient),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              verticalSpace(64.0),
              Image.asset(AppImages.logo),
              verticalSpace(32.0),
              Expanded(
                child: SizedBox(
                  width: screenWidth(context),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0.0,
                        left: screenWidthPercentage(context, percentage: .13),
                        right: screenWidthPercentage(context, percentage: .13),
                        child: Image.asset(AppImages.anteenaFull),
                      ),
                      Positioned(
                        bottom: screenHeightPercentage(context, percentage: .1),
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          width: screenWidth(context),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                              vertical: 16.0,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  LocaleKeys.wannaTalk.tr,
                                  style: blackBoldTextStyle.copyWith(
                                    color: AppColors.purple,
                                    fontSize: AppDimens.subHeadline,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                verticalSpace(24.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CustomButton(
                                      onTap: () => controller.showHome(),
                                      width: screenWidthPercentage(
                                        context,
                                        percentage: .3,
                                      ),
                                      position: 4.0.obs,
                                      color: AppColors.primaryAccentSoft,
                                      colorShadow:
                                          AppColors.primaryAccentShadow,
                                      label: LocaleKeys.yes.tr,
                                      textColor: AppColors.purple,
                                    ),
                                    CustomButton(
                                      onTap: () => controller.showHome(),
                                      width: screenWidthPercentage(
                                        context,
                                        percentage: .3,
                                      ),
                                      position: 4.0.obs,
                                      color: AppColors.primaryAccentSoft,
                                      colorShadow:
                                          AppColors.primaryAccentShadow,
                                      label: LocaleKeys.notNow.tr,
                                      textColor: AppColors.purple,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
