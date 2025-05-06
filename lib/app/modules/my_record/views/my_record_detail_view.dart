import 'package:bubbme/app/extensions/string_ext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared_ui/style/app_colors.dart';
import '../../../shared_ui/style/app_dimens.dart';
import '../../../shared_ui/style/app_styles.dart';
import '../../../utils/ui_helpers.dart';
import '../../my_period/widgets/period_app_bar.dart';
import '../controllers/my_record_detail_controller.dart';
import '../widgets/my_record_menu_view.dart';

class MyRecordDetailView extends GetView<MyRecordDetailController> {
  const MyRecordDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final period = controller.period.value;

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(24.0),
                Text(
                  period?.startPeriod?.formatTimeDisplayMonth() ??
                      ''.toUpperCase(),
                  style: blackSansitaRegularTextStyle.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: AppDimens.title,
                    color: AppColors.primary,
                  ),
                ),
                verticalSpace(16.0),
                Expanded(
                  child: MyRecordMenuView(
                    period: controller.period.value,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
