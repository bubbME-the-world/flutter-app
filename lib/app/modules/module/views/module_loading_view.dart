import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../shared_ui/style/app_colors.dart';
import '../../../shared_ui/style/app_dimens.dart';
import '../../../shared_ui/style/app_images.dart';
import '../../../shared_ui/style/app_styles.dart';
import '../../../shared_ui/widgets/custom_progress_bar.dart';
import '../../../utils/ui_helpers.dart';
import '../controllers/module_loading_controller.dart';
import '../widgets/menu_module.dart';

class ModuleLoadingView extends GetView<ModuleLoadingController> {
  const ModuleLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryAccentSoft,
      body: Stack(
        children: [
          Obx(() {
            final levelSelected = controller.levelSelected.value;

            return Column(
              children: [
                SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: AppDimens.padding,
                      right: AppDimens.padding,
                      top: 150.0,
                    ),
                    child: Container(
                      width: screenWidth(context),
                      decoration: BoxDecoration(
                        color: AppColors.brownModule,
                        borderRadius: BorderRadius.circular(32.0),
                        boxShadow: [shadow],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            verticalSpace(32.0),
                            Text(
                              levelSelected?.nodeTitle ?? '',
                              style: whiteBoldTextStyle.copyWith(
                                fontSize: AppDimens.headline,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            verticalSpace(8.0),
                            Text(
                              levelSelected?.nodeDescription ?? '',
                              style: whiteBoldTextStyle.copyWith(
                                fontSize: AppDimens.title,
                                fontWeight: FontWeight.w900,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                verticalSpace(24.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Stack(
                    children: [
                      CustomProgressBar(currentStep: controller.start.value),
                      SizedBox(
                        width: 82.0 +
                            ((screenWidth(context) - 96.0) *
                                controller.start.value /
                                2000),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Image.asset(
                            AppImages.ufo,
                            width: 82.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpace(24.0),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Image.asset(AppImages.headGlassesAnteena),
                    ),
                  ),
                )
              ],
            );
          }),
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                AppImages.globe,
                height: 200.0,
              ),
            ),
          ),
          MenuModule(
            onHomeTapped: () => controller.showHome(),
            onSettingTapped: () => controller.showSettingDialog(),
          ),
        ],
      ),
    );
  }
}
