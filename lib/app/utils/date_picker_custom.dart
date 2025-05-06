import 'package:bubbme/app/utils/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../shared_ui/style/app_colors.dart';
import '../shared_ui/style/app_dimens.dart';
import '../shared_ui/style/app_images.dart';
import '../shared_ui/style/app_styles.dart';

class DatePickerCustom extends StatelessWidget {
  final DateTime lastDayOfMonth;
  final RxInt selectedDate;
  final Function(int) onDateChange;
  final ItemScrollController itemScrollController;

  const DatePickerCustom({
    super.key,
    required this.lastDayOfMonth,
    required this.selectedDate,
    required this.onDateChange,
    required this.itemScrollController,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      itemScrollController.jumpTo(
        index: selectedDate.value + 1,
        alignment: 0.6,
      );
    });

    return SizedBox(
      height: 120.0,
      child: ScrollablePositionedList.separated(
        itemScrollController: itemScrollController,
        scrollDirection: Axis.horizontal,
        itemCount: lastDayOfMonth.day,
        separatorBuilder: (context, index) => verticalSpace(16.0),
        itemBuilder: (context, index) {
          final currentDate = lastDayOfMonth.add(Duration(days: index + 1));
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 16.0 : 0.0,
              right: 16.0,
            ),
            child: Obx(() {
              return GestureDetector(
                onTap: () {
                  onDateChange(currentDate.day - 1);
                  itemScrollController.scrollTo(
                    index: index + 1,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeIn,
                    alignment: 0.6,
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: selectedDate.value == index ? 0.0 : 8.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: AppColors.backgroundMyPeriodCalendar,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppImages.circleBrown,
                            height: selectedDate.value == index ? 42.0 : 34.0,
                            width: selectedDate.value == index ? 42.0 : 34.0,
                          ),
                          verticalSpace(8.0),
                          Text(
                            "${index + 1}",
                            style: blackSansitaRegularTextStyle.copyWith(
                              fontWeight: FontWeight.w800,
                              fontSize: selectedDate.value == index
                                  ? 28.0
                                  : AppDimens.title,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
