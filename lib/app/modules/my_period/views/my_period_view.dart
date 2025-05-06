import 'package:bubbme/app/extensions/string_ext.dart';
import 'package:bubbme/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../shared_ui/style/app_colors.dart';
import '../../../shared_ui/style/app_images.dart';
import '../../../shared_ui/style/app_styles.dart';
import '../../../shared_ui/widgets/buttons/custom_image_button.dart';
import '../../../shared_ui/widgets/common_error.dart';
import '../../../utils/ui_helpers.dart';
import '../controllers/my_period_controller.dart';
import '../widgets/card_period_date.dart';
import '../widgets/period_app_bar.dart';
import '../widgets/progress_period.dart';

class MyPeriodView extends GetView<MyPeriodController> {
  const MyPeriodView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: AppColors.white,
        appBar: PeriodAppBar(
          backgroundColor: AppColors.primaryAccentSoft,
          name: controller.profileLocal.name ?? '',
        ),
        body: Obx(
          () {
            final state = controller.periodState.value;

            return state.when(
              initial: () => const SizedBox(),
              loading: () => showLoading,
              success: (period) {
                final percentagePeriod = (period.percentagePeriod ?? 0.0) / 100;
                final currentPeriod = controller.currentPeriod.value;
                final startPeriod = period.startPeriod == ""
                    ? '---'
                    : period.startPeriod?.formatTimeDisplay();
                final endPeriod = period.endPeriod == ""
                    ? '---'
                    : period.endPeriod?.formatTimeDisplay();
                bool? isCanStartPeriod =
                    period.startPeriod?.isNotEmpty == true &&
                        currentPeriod != null;
                bool isSameDay = currentPeriod?.startPeriod ==
                    DateFormat('yyyy-MM-dd').format(DateTime.now());
                bool? isCanEndPeriod = !isSameDay || period.endPeriod?.isNotEmpty == true &&
                    currentPeriod != null;

                final date = DateTime.now();
                String currentDate = DateFormat('yyyy-MM-dd').format(date);

                return Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: AppColors.primaryAccentSoft,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32),
                            bottomRight: Radius.circular(32),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ProgressPeriod(
                                size: screenWidthPercentage(
                                  context,
                                  percentage: 0.6,
                                ),
                                progress: percentagePeriod,
                                startDate: period.startPeriod ?? '',
                                currentPeriod: currentPeriod,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CardPeriodDate(
                                    currentPeriod: currentPeriod,
                                    dateLabel: startPeriod,
                                    buttonTitle: LocaleKeys.startPeriod.tr,
                                    isEnableButton: !isCanStartPeriod,
                                    onTap: () => controller.addPeriod(
                                      startDate: currentDate,
                                    ),
                                  ),
                                  CardPeriodDate(
                                    currentPeriod: currentPeriod,
                                    dateLabel: endPeriod,
                                    buttonTitle: LocaleKeys.endPeriod.tr,
                                    isEnableButton: !isCanEndPeriod,
                                    onTap: () => controller.addPeriod(
                                      endDate: currentDate,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 32.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomImageButton(
                              onTap: () =>
                                  controller.showMyRecord(period.data ?? []),
                              position: 4.0.obs,
                              color: AppColors.brown,
                              colorShadow: AppColors.brownShadow,
                              label: LocaleKeys.record.tr.toUpperCase(),
                              textColor: AppColors.white,
                              icon: AppImages.iconRecord,
                            ),
                            CustomImageButton(
                              onTap: () => controller.showMyPeriodCalendar(),
                              position: 4.0.obs,
                              color: AppColors.brown,
                              colorShadow: AppColors.brownShadow,
                              label: LocaleKeys.calendar.tr.toUpperCase(),
                              textColor: AppColors.white,
                              icon: AppImages.iconCalendar,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
              error: (error) => SingleChildScrollView(
                child: CommonError(
                  reload: () async => controller.getPeriod(),
                  error: error,
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
