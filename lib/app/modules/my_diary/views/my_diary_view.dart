import 'package:bubbme/app/shared_ui/style/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../shared_ui/style/app_colors.dart';
import '../../../shared_ui/style/app_dimens.dart';
import '../../../shared_ui/style/app_images.dart';
import '../../../shared_ui/widgets/common_error.dart';
import '../../../utils/ui_helpers.dart';
import '../controllers/my_diary_controller.dart';

class MyDiaryView extends GetView<MyDiaryController> {
  const MyDiaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.myDiary.tr,
          style: blackSansitaRegularTextStyle.copyWith(
            fontSize: AppDimens.title,
            fontWeight: FontWeight.w800,
            color: AppColors.primary,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 8.0,
            ),
            child: IconButton(
              onPressed: () => controller.showHome(),
              icon: Image.asset(
                AppImages.iconBackHome,
                width: 32.0,
              ),
            ),
          ),
        ],
      ),
      body: Obx(() {
        final diariesState = controller.diariesState.value;

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: CalendarCarousel<Event>(
                onDayPressed: (DateTime date, List<Event> events) {
                  controller.setDateSelected(date);
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
              ),
            ),
            verticalSpace(24.0),
            Text(
              LocaleKeys.clickTheDateDesc.tr,
              style: primarySemiBoldTextStyle.copyWith(
                fontSize: AppDimens.caption,
              ),
            ),
            verticalSpace(16.0),
            Expanded(
              child: Container(
                width: screenWidth(context),
                decoration: const BoxDecoration(
                  color: AppColors.primaryAccentSoft,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(32),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.dateTitleSelected.value,
                            style: blackSansitaRegularTextStyle.copyWith(
                              fontSize: 20,
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => controller.showMyDiaryDetail(
                              isCreate: true,
                            ),
                            child: Image.asset(
                              AppImages.iconButtonAdd,
                              width: 32.0,
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(16.0),
                      Expanded(
                        child: diariesState.when(
                          initial: () => const SizedBox(),
                          loading: () => showLoading,
                          success: (diaries) => ListView.builder(
                            itemCount: diaries.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final diary = diaries[index];

                              return GestureDetector(
                                onTap: () => controller.showMyDiaryDetail(
                                  isCreate: false,
                                  id: diary.diaryId,
                                ),
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 8.0),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 8.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: Text(
                                    diary.diaryTitle ?? '',
                                    style: blackBoldTextStyle.copyWith(
                                      fontSize: AppDimens.body,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          error: (error) => SingleChildScrollView(
                            child: CommonError(
                              reload: () async => controller.getDiaries(),
                              error: error,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
