import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../generated/locales.g.dart';
import '../../../shared_ui/style/app_colors.dart';
import '../../../shared_ui/style/app_dimens.dart';
import '../../../shared_ui/style/app_styles.dart';
import '../../../shared_ui/widgets/buttons/custom_button.dart';
import '../../../utils/date_picker_custom.dart';
import '../../../utils/ui_helpers.dart';
import '../../my_record/widgets/my_record_menu_view.dart';
import '../controllers/my_period_detail_controller.dart';
import '../widgets/period_app_bar.dart';

class MyPeriodDetailView extends GetView<MyPeriodDetailController> {
  const MyPeriodDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: AppColors.white,
        appBar: PeriodAppBar(
          name: controller.profileLocal.name ?? '',
        ),
        body: Container(
          width: screenWidth(context),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
            color: AppColors.primaryAccentSoft,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(24.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  LocaleKeys.myPeriod.tr.toUpperCase(),
                  style: blackSansitaRegularTextStyle.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: AppDimens.title,
                    color: AppColors.primary,
                  ),
                ),
              ),
              verticalSpace(24.0),
              DatePickerCustom(
                itemScrollController: controller.itemScrollController,
                lastDayOfMonth: controller.lastDayOfMonth,
                selectedDate: controller.currentDate,
                onDateChange: (value) {
                  controller.currentDate.value = value;
                  controller.filterPeriodByDay();
                },
              ),
              verticalSpace(24.0),
              Obx(() {
                final period = controller.periodSelected.value;
                final currentPeriod = controller.currentPeriod.value;

                bool? isCanStartPeriod =
                    controller.period.value?.startPeriod?.isNotEmpty == true &&
                        currentPeriod != null;
                bool? isCanEndPeriod = controller.isCanEndPeriod();

                DateTime currentDateSelected = DateTime(
                  controller.dateSelected.value!.year,
                  controller.dateSelected.value!.month,
                  controller.currentDate.value + 1,
                );
                String currentDate = DateFormat("yyyy-MM-dd").format(
                  currentDateSelected,
                );
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomButton(
                              onTap: !isCanStartPeriod
                                  ? () => controller.addPeriod(
                                        startDate: currentDate,
                                      )
                                  : () {},
                              isEnable: !isCanStartPeriod,
                              width: 132.0,
                              height: 34.0,
                              position: 4.0.obs,
                              color: AppColors.brown,
                              colorShadow: AppColors.brownShadow,
                              label: LocaleKeys.startPeriod.tr.toUpperCase(),
                              textColor: AppColors.white,
                            ),
                            CustomButton(
                              onTap: !isCanEndPeriod
                                  ? () => controller.addPeriod(
                                        endDate: currentDate,
                                      )
                                  : () {},
                              isEnable: !isCanEndPeriod,
                              width: 132.0,
                              height: 34.0,
                              position: 4.0.obs,
                              color: AppColors.brown,
                              colorShadow: AppColors.brownShadow,
                              label: LocaleKeys.endPeriod.tr.toUpperCase(),
                              textColor: AppColors.white,
                            ),
                          ],
                        ),
                        verticalSpace(24.0),
                        if (period != null)
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  LocaleKeys.aboutMyPeriod.tr.toUpperCase(),
                                  style: blackSansitaRegularTextStyle.copyWith(
                                    fontWeight: FontWeight.w800,
                                    fontSize: AppDimens.title,
                                    color: AppColors.primary,
                                  ),
                                ),
                                verticalSpace(16.0),
                                Expanded(
                                  child: MyRecordMenuView(period: period),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      );
    });
  }
}
