import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entity/period.dart';
import '../../../shared_ui/style/app_colors.dart';
import '../../../shared_ui/style/app_styles.dart';
import '../../../shared_ui/widgets/buttons/custom_button.dart';
import '../../../utils/ui_helpers.dart';

class CardPeriodDate extends StatelessWidget {
  final Period? currentPeriod;
  final String? dateLabel;
  final String buttonTitle;
  final bool isEnableButton;
  final VoidCallback onTap;

  const CardPeriodDate({
    super.key,
    this.currentPeriod,
    this.dateLabel,
    required this.buttonTitle,
    this.isEnableButton = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            if (currentPeriod != null)
              Column(
                children: [
                  Text(
                    dateLabel ?? '---',
                    style: blackBoldTextStyle,
                  ),
                  verticalSpace(8.0),
                ],
              ),
            CustomButton(
              onTap: onTap,
              isEnable: isEnableButton,
              width: 132.0,
              height: 34.0,
              position: 4.0.obs,
              color: AppColors.brown,
              colorShadow: AppColors.brownShadow,
              label: buttonTitle.toUpperCase(),
              textColor: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
