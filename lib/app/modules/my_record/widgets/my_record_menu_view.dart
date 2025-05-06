import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../domain/entity/period.dart';
import '../../../shared_ui/style/app_dimens.dart';
import '../../../utils/ui_helpers.dart';
import '../controllers/my_record_menu_controller.dart';
import 'card_record_period.dart';

class MyRecordMenuView extends StatefulWidget {
  final Period? period;

  const MyRecordMenuView({
    super.key,
    this.period,
  });

  @override
  State<MyRecordMenuView> createState() => _MyRecordMenuViewState();
}

class _MyRecordMenuViewState extends State<MyRecordMenuView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyRecordMenuController>(builder: (controller) {
      controller.period.value = widget.period;
      return SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () => controller.getPeriodNote(),
              child: CardRecordPeriod(
                recordLabel: LocaleKeys.myNotes.tr,
              ),
            ),
            verticalSpace(AppDimens.spaceSmall),
            GestureDetector(
              onTap: () => controller.getPeriodPills(),
              child: CardRecordPeriod(
                recordLabel: LocaleKeys.myPills.tr,
              ),
            ),
            verticalSpace(AppDimens.spaceSmall),
            GestureDetector(
              onTap: () => controller.getPeriodSymptom(),
              child: CardRecordPeriod(
                recordLabel: LocaleKeys.mySymptom.tr,
              ),
            ),
            verticalSpace(AppDimens.spaceSmall),
            GestureDetector(
              onTap: () => controller.getMoods(),
              child: CardRecordPeriod(
                recordLabel: LocaleKeys.myMood.tr,
              ),
            ),
            verticalSpace(AppDimens.spaceSmall),
            GestureDetector(
              onTap: () => controller.getPeriodWeight(),
              child: CardRecordPeriod(
                recordLabel: LocaleKeys.myWeight.tr,
              ),
            ),
          ],
        ),
      );
    });
  }
}
