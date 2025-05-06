import 'package:bubbme/app/extensions/string_ext.dart';
import 'package:bubbme/app/utils/ui_helpers.dart';
import 'package:bubbme/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared_ui/style/app_colors.dart';
import '../../../shared_ui/style/app_dimens.dart';
import '../../../shared_ui/style/app_styles.dart';
import '../../my_period/widgets/period_app_bar.dart';
import '../controllers/my_record_controller.dart';

class MyRecordView extends GetView<MyRecordController> {
  const MyRecordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final records = controller.periodRecords.value;

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
                  LocaleKeys.myRecord.tr.toUpperCase(),
                  style: blackSansitaRegularTextStyle.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: AppDimens.title,
                    color: AppColors.primary,
                  ),
                ),
                verticalSpace(16.0),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: records?.length,
                    itemBuilder: (context, index) {
                      final item = records?[index];
                      return GestureDetector(
                        onTap: () => controller.showDetail(item!),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                          color: AppColors.white,
                          child: ListTile(
                            title: Text(
                              item?.startPeriod?.formatTimeDisplayMonth() ?? '',
                              style: primaryBoldTextStyle,
                            ),
                            trailing: Transform.rotate(
                              angle: 3.14 / 2,
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                size: 16.0,
                                color: AppColors.primaryAccent,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
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
