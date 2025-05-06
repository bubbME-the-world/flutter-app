import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../shared_ui/style/app_colors.dart';
import '../../../shared_ui/style/app_dimens.dart';
import '../../../shared_ui/style/app_images.dart';
import '../../../shared_ui/style/app_styles.dart';
import '../../../shared_ui/widgets/buttons/custom_button.dart';
import '../../../utils/ui_helpers.dart';
import '../controllers/period_controller.dart';

class PeriodView extends GetView<PeriodController> {
  const PeriodView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: backgroundGradient),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                verticalSpace(16.0),
                Image.asset(AppImages.logoTagLine),
                verticalSpace(84.0),
                Expanded(
                  child: Image.asset(AppImages.anteenaFull),
                ),
                verticalSpace(8.0),
                Text(
                  LocaleKeys.periodHealth.tr.toUpperCase(),
                  style: blackSansitaRegularTextStyle.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: AppDimens.title,
                    color: AppColors.primary,
                  ),
                ),
                verticalSpace(16.0),
                Text(
                  LocaleKeys.periodHealthDesc.tr.toUpperCase(),
                  style: primaryBoldTextStyle.copyWith(
                    fontSize: AppDimens.body,
                  ),
                  textAlign: TextAlign.center,
                ),
                verticalSpace(16.0),
                CustomButton(
                  onTap: () => controller.showMyPeriod(),
                  position: 4.0.obs,
                  color: AppColors.white,
                  colorShadow: AppColors.whiteBoxShadow,
                  label: LocaleKeys.myPeriod.tr.toUpperCase(),
                  textColor: AppColors.primary,
                ),
                verticalSpace(16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
