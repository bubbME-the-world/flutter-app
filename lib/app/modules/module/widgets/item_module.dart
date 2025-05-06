import 'package:bubbme/app/shared_ui/style/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../domain/entity/module.dart';
import '../../../shared_ui/style/app_colors.dart';
import '../../../shared_ui/style/app_styles.dart';
import '../../../shared_ui/widgets/buttons/custom_button.dart';
import '../../../shared_ui/widgets/buttons/custom_button_icon.dart';
import '../../../utils/ui_helpers.dart';

class ItemModule extends StatelessWidget {
  final Module module;
  final VoidCallback onGoTapped;

  const ItemModule({
    super.key,
    required this.onGoTapped,
    required this.module,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: [shadow],
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: screenWidth(context),
                    decoration: BoxDecoration(
                      color: AppColors.brownModule,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [shadow],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        module.moduleTitle ?? '',
                        style: whiteBoldTextStyle,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
                verticalSpace(16.0),
                CustomButton(
                  onTap: onGoTapped,
                  width: 84.0,
                  height: 32.0,
                  position: 4.0.obs,
                  color: AppColors.whiteBox,
                  colorShadow: AppColors.whiteBoxShadow,
                  textSize: 14.0,
                  textColor: AppColors.primary,
                  label: LocaleKeys.go.tr.toUpperCase(),
                ),
              ],
            ),
          ),
          if (module.isLocked != false)
            Container(
              width: screenWidth(context),
              decoration: BoxDecoration(
                color: AppColors.black.withOpacity(.5),
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.iconLockModule, width: 54.0),
                  verticalSpace(16.0),
                  CustomButtonIcon(
                    onTap: () {},
                    width: 150.0,
                    position: 4.0.obs,
                    color: AppColors.whiteBox,
                    colorShadow: AppColors.whiteBoxShadow,
                    textSize: 14.0,
                    textColor: AppColors.primary,
                    label: '${LocaleKeys.youNeed.tr} ${module.modulePrice}'
                        .toUpperCase(),
                    icon: AppImages.iconHeartCoin,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
