import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../domain/entity/level.dart';
import '../../../shared_ui/style/app_colors.dart';
import '../../../shared_ui/style/app_dimens.dart';
import '../../../shared_ui/style/app_images.dart';
import '../../../shared_ui/style/app_styles.dart';
import '../../../shared_ui/widgets/buttons/custom_button.dart';
import '../../../shared_ui/widgets/buttons/custom_button_icon.dart';
import '../../../utils/ui_helpers.dart';

class ItemModuleLevel extends StatelessWidget {
  final Level level;
  final VoidCallback onStartTapped;

  const ItemModuleLevel({
    super.key,
    required this.level,
    required this.onStartTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(32.0),
        boxShadow: [shadow],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 12.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              level.nodeTitle ?? '',
              style: primaryBoldTextStyle.copyWith(
                fontSize: AppDimens.headline,
              ),
            ),
            verticalSpace(8.0),
            Text(
              level.nodeDescription ?? '',
              style: primaryBoldTextStyle,
            ),
            verticalSpace(12.0),
            Align(
              alignment: Alignment.centerRight,
              child: level.isLocked != false
                  ? CustomButtonIcon(
                      onTap: () {},
                      width: 120.0,
                      height: 40.0,
                      position: 4.0.obs,
                      color: AppColors.whiteBox,
                      colorShadow: AppColors.whiteBoxShadow,
                      textSize: 14.0,
                      textColor: AppColors.primary,
                      label: '${LocaleKeys.need.tr} ${level.nodePrice}'
                          .toUpperCase(),
                      icon: AppImages.iconHeartCoin,
                    )
                  : CustomButton(
                      onTap: onStartTapped,
                      width: 120.0,
                      height: 40.0,
                      position: 4.0.obs,
                      color: AppColors.whiteBox,
                      colorShadow: AppColors.whiteBoxShadow,
                      textSize: 14.0,
                      textColor: AppColors.primary,
                      label: LocaleKeys.start.tr.toUpperCase(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
