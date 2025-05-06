import 'package:bubbme/app/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../shared_ui/style/app_colors.dart';
import '../../../shared_ui/style/app_dimens.dart';
import '../../../shared_ui/style/app_images.dart';
import '../../../shared_ui/style/app_styles.dart';
import '../../my_period/widgets/period_app_bar.dart';
import '../controllers/my_period_calendar_controller.dart';

class MyPeriodCalendarView extends GetView<MyPeriodCalendarController> {
  const MyPeriodCalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PeriodAppBar(
        title: LocaleKeys.myPeriod.tr.toUpperCase(),
      ),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              CalendarCarousel<Event>(
                onDayPressed: (DateTime date, List<Event> events) {
                  controller.showMyPeriodDetail(date);
                  // controller.selectDate(date);
                },
                weekendTextStyle: const TextStyle(
                  color: Colors.red,
                ),
                thisMonthDayBorderColor: Colors.grey,
                weekFormat: false,
                height: 424.0,
                selectedDateTime: controller.dateSelected.value,
                daysHaveCircularBorder: true,
                dayButtonColor: AppColors.dayCalendarBackground,
                selectedDayButtonColor: AppColors.dayCalendarSelected,
                selectedDayBorderColor: AppColors.dayCalendarSelected,
                iconColor: AppColors.dayCalendarBackground,
                headerTextStyle: blackSansitaRegularTextStyle.copyWith(
                  fontSize: 20,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
                todayBorderColor: AppColors.primary,
                todayButtonColor: AppColors.primary,
                multipleMarkedDates: controller.multipleMarkedDates.value,
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.space,
                      ),
                      child: Text(
                        LocaleKeys.periodCalenderDesc.tr.toUpperCase(),
                        style: primaryBoldTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    verticalSpace(AppDimens.spaceSmall),
                    Expanded(
                      child: Image.asset(AppImages.anteena),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
