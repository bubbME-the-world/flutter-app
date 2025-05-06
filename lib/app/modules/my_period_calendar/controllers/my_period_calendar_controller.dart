import 'package:flutter_calendar_carousel/classes/marked_date.dart';
import 'package:flutter_calendar_carousel/classes/multiple_marked_dates.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/base_controller.dart';
import '../../../domain/entity/period.dart';
import '../../../domain/entity/period_data.dart';
import '../../../routes/app_pages.dart';
import '../../../shared_ui/style/app_colors.dart';

class MyPeriodCalendarController extends BaseController {
  final period = Rx<PeriodData?>(null);
  final multipleMarkedDates =
      Rx<MultipleMarkedDates>(MultipleMarkedDates(markedDates: []));

  final dateSelected = DateTime.now().obs;
  final periodSelected = Rx<Period?>(null);

  @override
  void onInit() {
    super.onInit();
    period.value = Get.arguments as PeriodData;
    setRangePeriod();
  }

  void setRangePeriod() {
    for (int i = 0; i < (period.value?.data?.length ?? 0); i++) {
      final periodData = period.value?.data?[i];
      final dayCount = getCountDayPeriod(
        periodData?.startPeriod ?? '',
        periodData?.endPeriod ?? '',
      );
      DateTime startDate = DateFormat("yyyy-MM-dd HH:mm").parse(
        periodData?.startPeriod ?? '',
      );
      multipleMarkedDates.value.addRange(
        MarkedDate(
          date: DateTime(startDate.year, startDate.month, startDate.day),
          color: AppColors.dayCalendarSelectedRed,
        ),
        plus: dayCount,
      );
    }
  }

  int getCountDayPeriod(String startPeriod, String endPeriod) {
    DateTime startDate = DateFormat("yyyy-MM-dd HH:mm").parse(startPeriod);
    DateTime endDate = DateFormat("yyyy-MM-dd HH:mm").parse(endPeriod);

    DateTime startDay =
        DateTime(startDate.year, startDate.month, startDate.day);
    DateTime endDay = DateTime(endDate.year, endDate.month, endDate.day);

    int dayCount = endDay.difference(startDay).inDays;
    return dayCount;
  }

  Period? findPeriodByDate() {
    final periodData = period.value?.data?.firstWhere(
      (element) {
        DateTime startDate = DateFormat("yyyy-MM-dd HH:mm").parse(
          element.startPeriod ?? '',
        );
        DateTime endDate = DateFormat("yyyy-MM-dd HH:mm").parse(
          element.endPeriod ?? '',
        );
        DateTime startDay =
            DateTime(startDate.year, startDate.month, startDate.day - 1);
        DateTime endDay =
            DateTime(endDate.year, endDate.month, endDate.day + 1);
        return dateSelected.value.isAfter(startDay) &&
            dateSelected.value.isBefore(endDay);
      },
    );
    return periodData;
  }

  void selectDate(DateTime date) {
    periodSelected.value = null;
    update();
    dateSelected.value = date;
    selectPeriod();
  }

  void selectPeriod() {
    for (int i = 0; i < (period.value?.data?.length ?? 0); i++) {
      final periodData = period.value?.data?[i];
      DateTime startDate = DateFormat("yyyy-MM-dd HH:mm").parse(
        periodData?.startPeriod ?? '',
      );
      DateTime endDate = DateFormat("yyyy-MM-dd HH:mm").parse(
        periodData?.endPeriod ?? '',
      );
      DateTime startDay =
          DateTime(startDate.year, startDate.month, startDate.day - 1);
      DateTime endDay = DateTime(endDate.year, endDate.month, endDate.day + 1);
      if (dateSelected.value.isAfter(startDay) &&
          dateSelected.value.isBefore(endDay)) {
        periodSelected.value = periodData;
        return;
      }
    }
    update();
  }

  void showMyPeriodDetail(DateTime date) => Get.toNamed(
        Routes.MY_PERIOD_DETAIL,
        arguments: [
          date,
          period.value,
        ],
      )?.then((value) {
        if (value != null) {
          final isBack = value as bool;
          if (isBack) {
            Get.back();
          }
        }
      });
}
