import 'package:bubbme/app/shared_ui/style/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../domain/entity/mood.dart';
import '../../../utils/ui_helpers.dart';
import '../../style/app_colors.dart';
import '../../style/app_dimens.dart';
import '../../style/app_images.dart';
import '../buttons/custom_button.dart';

class MyMoodDialog extends StatelessWidget {
  final Mood moodSelected;
  final VoidCallback onSaveTapped;

  const MyMoodDialog({
    super.key,
    required this.moodSelected,
    required this.onSaveTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
      ),
      child: Center(
        child: Container(
          width: screenWidth(context),
          decoration: BoxDecoration(
            color: AppColors.popupBackground,
            borderRadius: BorderRadius.circular(40),
            boxShadow: const [
              BoxShadow(
                color: AppColors.popupBackground,
                offset: Offset(0, 12),
                blurRadius: 0,
                spreadRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: Material(
              color: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  verticalSpace(24.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: Get.back,
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.grey,
                        ),
                      ),
                      horizontalSpace(16.0),
                      Text(
                        LocaleKeys.myMood.tr.toUpperCase(),
                        style: blackSansitaRegularTextStyle.copyWith(
                          fontSize: AppDimens.title,
                          fontWeight: FontWeight.w800,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(24.0),
                  CustomButton(
                    onTap: () {},
                    position: 4.0.obs,
                    color: AppColors.whiteBox,
                    colorShadow: AppColors.whiteBoxShadow,
                    label: (moodSelected.moodName ?? '').toUpperCase(),
                  ),
                  verticalSpace(32.0),
                  Image.asset(
                    AppImages.anteenaFull,
                    width: screenWidthPercentage(context, percentage: 0.4),
                  ),
                  verticalSpace(16.0),
                  CustomButton(
                    onTap: onSaveTapped,
                    position: 4.0.obs,
                    color: AppColors.whiteBox,
                    colorShadow: AppColors.whiteBoxShadow,
                    label: LocaleKeys.save.tr.toUpperCase(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
