import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../generated/locales.g.dart';
import '../../../domain/entity/period.dart';
import '../../../shared_ui/style/app_colors.dart';
import '../../../shared_ui/style/app_dimens.dart';
import '../../../shared_ui/style/app_images.dart';
import '../../../shared_ui/style/app_styles.dart';
import '../../../utils/ui_helpers.dart';

class ProgressPeriod extends StatelessWidget {
  final double size;
  final double progress;
  final String startDate;
  final Period? currentPeriod;

  const ProgressPeriod({
    super.key,
    required this.size,
    required this.progress,
    required this.startDate,
    this.currentPeriod,
  });

  @override
  Widget build(BuildContext context) {
    String getPeriodDayCount(String startDatePeriod) {
      DateTime startDate = DateFormat("yyyy-MM-dd HH:mm").parse(startDatePeriod);
      DateTime now = DateTime.now();
      DateTime today = DateTime(now.year, now.month, now.day);
      DateTime startDay =
      DateTime(startDate.year, startDate.month, startDate.day);
      int dayCount = today.difference(startDay).inDays + 1;
      return dayCount.toString();
    }

    return SizedBox(
      height: size + 8,
      width: size,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Column(
                children: [
                  verticalSpace(24.0),
                  if (currentPeriod != null)
                    Column(
                      children: [
                        Text(
                          '${LocaleKeys.day.tr} ${getPeriodDayCount(startDate)}'.toUpperCase(),
                          style: blackSansitaRegularTextStyle.copyWith(
                            fontSize: AppDimens.title,
                            fontWeight: FontWeight.w800,
                            color: AppColors.primary,
                          ),
                        ),
                        verticalSpace(16.0),
                      ],
                    ),
                  Expanded(
                    child: Image.asset(AppImages.anteena),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: SizedBox(
              height: size,
              width: size,
              child: const CircularProgressIndicator(
                strokeWidth: 32.0,
                backgroundColor: AppColors.brownShadow,
                color: AppColors.brownShadow,
                value: 0.0,
              ),
            ),
          ),
          SizedBox(
            height: size,
            width: size,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 32.0,
              color: AppColors.primary,
              backgroundColor: AppColors.brown,
            ),
          ),
        ],
      ),
    );
  }
}
